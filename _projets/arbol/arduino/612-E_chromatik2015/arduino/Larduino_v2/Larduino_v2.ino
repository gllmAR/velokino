#include "FastLED.h"
#include <Ethernet.h>
#include <EthernetUdp.h>         
#include <SPI.h>  
#include <EEPROM.h>
#include <Statistic.h>
#include "Dns.h"
#include <Artnet.h>


#define SERVER_PORT 8888
#define TEST_pin 9        // * ??
#define POWER_LED_pin 8   //   ??
#define ETH_LED_pin 6     // 
#define TEST_LED_pin 7    // 

// W5200 stuff
//#define W5200
#ifdef  W5200
#define SS   10   
#define nRST  8  
#define nPWDN 9  
#define nINT  3  
#endif

// datapins
#define DP0 14
#define DP1 16
#define DP2 18
#define DP3 20

// clockpins
#define CP0 15
#define CP1 17
#define CP2 19
#define CP3 21

// ledpins
#define LP0 2
#define LP1 3              // *
#define LP2 4
#define LP3 5

#define NUMLEDS 500
#define test_time 500

// from artificiel.jit.udpcopy header protocol
#define packetheadersize 9

CRGB strip0[NUMLEDS];
CRGB strip1[NUMLEDS];
CRGB strip2[NUMLEDS];
//CRGB strip3[NUMLEDS];

CRGB *strips[4];
int id_pgm = 221;

int laststrip = -1;

// message UDP pour re-assigner addresse IP dans eeprom
// message UDP pour re-assigner NUMLEDs par strip // definir 4 strips pleines, puis assigner la substrip

Statistic packetstats; 
Statistic renderstats; 

byte mac[] = { 
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
IPAddress serverip(10, 10, 10,  100);
int unique_id;

const char* host = "la-luxctrl.lan";			

// FPS info
int timestamp = 0;
int average = 0;
int renderstamp = 0;
int rendercount = 0;
int framecount = 0;
long lastpacket = 0;
int testMode = 0;

// stuff UDP
Artnet artnet;

uint8_t *udp_pixels;
char ReplyBuffer[200];      
EthernetUDP Udp;
//DNSClient Dns;

int ramBufferSize = 500; 
int ramHeadBuff = 32;  //20 - Uno
int dropped = 0;

void send(char *buffer) {
  digitalWrite(ETH_LED_pin,HIGH);
  Udp.beginPacket(serverip, SERVER_PORT);
  Udp.write(buffer);
  Udp.endPacket();
  digitalWrite(ETH_LED_pin,LOW);
}

void testToggle() {
  testMode = !testMode;
}
#define NUM_STRIPS 3
int ledpins[NUM_STRIPS] = {
  LP0,LP1,LP2};
int datapins[NUM_STRIPS] = {
  DP0,DP1,DP2};

void setup() { 

  strips[0]=strip0;
  strips[1]=strip1;
  strips[2]=strip2;

  for (int i=0;i<NUM_STRIPS;i++) {
    pinMode(ledpins[i],OUTPUT);
    analogWrite(ledpins[i],0);
  }

  FastLED.addLeds<WS2811, DP0, GRB>(strips[0], NUMLEDS);
  FastLED.addLeds<WS2811, DP1, GRB>(strips[1], NUMLEDS);
  FastLED.addLeds<WS2811, DP2, GRB>(strips[2], NUMLEDS);
  
//  FastLED.addLeds<WS2811, DP3, RGB>(strips[3], NUMLEDS);
//  FastLED.addLeds<LPD8806, DP0, CP0, BRG>(strips[0], NUMLEDS);
//  FastLED.addLeds<LPD8806, DP1, CP1, BRG>(strips[1], NUMLEDS);
//  FastLED.addLeds<LPD8806, DP2, CP2, BRG>(strips[2], NUMLEDS);
//  FastLED.addLeds<LPD8806, DP3, CP3, BRG>(strips[3], NUMLEDS);

  pinMode(TEST_pin, INPUT_PULLUP);
  pinMode(POWER_LED_pin, OUTPUT);
  pinMode(ETH_LED_pin, OUTPUT);
  pinMode(TEST_LED_pin, OUTPUT);
  digitalWrite(POWER_LED_pin,HIGH);
  digitalWrite(ETH_LED_pin,HIGH);
  digitalWrite(TEST_LED_pin,LOW);

  attachInterrupt(TEST_pin, testToggle, RISING);

#ifdef W5200
  //W5200 init sequence from wiznet
  pinMode(SS,OUTPUT);  
  pinMode(nRST,OUTPUT);
  pinMode(nPWDN,OUTPUT);
  pinMode(nINT,INPUT); 
  digitalWrite(nPWDN,LOW);  //enable power
  digitalWrite(nRST,LOW);  //Reset W5200
  delay(10);
  digitalWrite(nRST,HIGH);  
  delay(200);       // wait W5200 work
#endif

  Serial.begin(9600);
  Serial.println("Hello World");

  udp_pixels = (uint8_t *)malloc(ramBufferSize+ramHeadBuff);

  //*** ID management  ***//
  EEPROM.write(0,id_pgm); // one-time operation 
  unique_id = EEPROM.read(0);
  //**********************//

  mac[5] = unique_id;
  IPAddress rem_add;
  Serial.print("starting ethernet...");
  IPAddress ip(10, 10, 10, unique_id);
  byte ipByte[]={
    10,10,10,unique_id  };
  //int dhcpstat = Ethernet.begin(mac);
//  Ethernet.begin(mac,ip);
  artnet.begin(mac, ipByte);
  Serial.println("ethernet running!");

  //  if (dhcpstat == 0) {
  //    Serial.println("no DHCP; using buil-tin address");
  //    IPAddress ip(192, 168, 101, unique_id);
  //
  //     Ethernet.begin(mac,ip);
  //  }

  Serial.print("My IP address: ");
  for (byte thisByte = 0; thisByte < 4; thisByte++) {
    Serial.print(Ethernet.localIP()[thisByte], DEC);
    Serial.print("."); 
  }
  Serial.println();
  Serial.println("Server DNS fail... using default ");

  //  }
  //  delay(1000);	// wait to see if a reply is available

  Serial.print("starting UDP...");
  Udp.begin(9999);

  Serial.println("running.");

  timestamp = millis();
  packetstats.clear();
  renderstats.clear();

  sprintf(ReplyBuffer, "%i.%i.%i.%i: stat: Setup done\n",\
            Ethernet.localIP()[0],Ethernet.localIP()[1],\
            Ethernet.localIP()[2],Ethernet.localIP()[3]);
  send(ReplyBuffer);

  for(int  x = 0 ; x <= NUMLEDS; x++) {
    strip0[x].setRGB( 0,0,0);
    strip1[x].setRGB( 0,0,0);
    strip2[x].setRGB( 0,0,0);
//    strip3[x].setRGB( 0,0,0);
  }
  FastLED.show();
}

void loop() { 
  if (testMode==1) { 
    test();
  }

  if (artnet.read() == ART_DMX)
  {
    // print out our data
    int strip = artnet.getUniverse();
    int size = artnet.getLength();
//    Serial.print("\tsequence n0. = ");
//    Serial.println(artnet.getSequence());
      digitalWrite(ledpins[strip],HIGH);
    digitalWrite(ETH_LED_pin,HIGH);

    if (strip==0) {
      memcpy(strip0, artnet.getDmxFrame(), artnet.getLength());
    } 
    else if (strip==1) {
      memcpy(strip1, artnet.getDmxFrame(), artnet.getLength());
    } 
    else if (strip==2) {
      memcpy(strip2, artnet.getDmxFrame(), artnet.getLength());
    } 
    else if (strip==3) {
 //     memcpy(strip3, artnet.getDmxFrame(), artnet.getLength());
    } 
    FastLED.show();
    digitalWrite(ledpins[strip],LOW);
    digitalWrite(ETH_LED_pin,LOW);
  }

  //  digitalWrite(TEST_LED_pin,LOW)

  int packetSize = Udp.parsePacket();
  if(packetSize)
  {

  //  Serial.println(packetSize);
  //  Serial.println("pack...");	 
    digitalWrite(ETH_LED_pin,HIGH);

    Udp.read(udp_pixels,packetSize); 
    long start,finish;

    int magic = udp_pixels[0];
    if (magic==2) {
      // data de controle . ex:
    } 
    else if (magic==1) {

      int strip = udp_pixels[3] & 15;
      int bang = udp_pixels[3] & 128;
      int special = udp_pixels[3] & 64;

      if (strip != laststrip) {
        laststrip=strip;
        //       Serial.print("strip ");	 
        //       Serial.println(strip);	 
      }

      long offset = (udp_pixels[7]*256)+udp_pixels[8];
      long currentpacket = (udp_pixels[4]*256)+udp_pixels[5];
      long payloadSize = (udp_pixels[1]*256)+udp_pixels[2];

      if (packetSize!=payloadSize) {
        Serial.println("wrong packet size...");	 
        dropped++;
      } 
      //   else {
      //#define OPTIMIZE
#ifdef OPTIMIZE
      offset = 0; // si le header est corrompu ça peut ecrire ailleurs
#endif
      // changer ici STRIPn_NUM_LEDS pour valeur dans EEPROM

      // erreur de pointeur si on passe part strips[strip] a voir pour nettoyer code...
      digitalWrite(ledpins[strip],HIGH);
      if (strip==0) {
        memcpy(strip0+offset, udp_pixels+packetheadersize, packetSize-packetheadersize);
      } 
      else if (strip==1) {
        memcpy(strip1+offset, udp_pixels+packetheadersize, packetSize-packetheadersize);
      } 
      else if (strip==2) {
        memcpy(strip2+offset, udp_pixels+packetheadersize, packetSize-packetheadersize);
      } 
      else if (strip==3) {
 //       memcpy(strip3+offset, udp_pixels+packetheadersize, packetSize-packetheadersize);
      } 
//      	for(int i = 0; i < NUMLEDS; i++) {
//		strip0[i] = CRGB::Red;
//      }

      int now = micros();
      if (bang) {
        start = micros();
        FastLED.show();
        finish = micros();
 //       FastLED.m_Controllers[0].pLedController->show(FastLED.m_Controllers[0].pLedData,packetSize-packetheadersize/3,1);
        renderstats.add(now-renderstamp);
        renderstamp=now;
      }
      //  }
      digitalWrite(ledpins[strip],LOW);

      //     digitalWrite(STRIP1_ACT_LED_pin,LOW);

      framecount++;
      int delta = millis()-timestamp;
      if (delta > 1000) {
        timestamp = millis();
#ifndef OPTIMIZE
        float average = renderstats.average();
        float pop_stdev = renderstats.pop_stdev();
        int count = renderstats.count();
        long elapsed = finish-start;

        sprintf(ReplyBuffer, "%i: stat: %i packets = %i frames in %i ms (delta ~%iµs, dev ~%iµs)[%i]\n",unique_id,framecount,count,delta,int(average) , int(pop_stdev),elapsed);
        framecount=0;
        send(ReplyBuffer);

        if (dropped>0) {
          sprintf(ReplyBuffer, "%i: stat: got %i fat packets\n",unique_id,dropped);
          dropped = 0;
          send(ReplyBuffer);
        }
        packetstats.clear();
        renderstats.clear();
#endif
      }
    }
    digitalWrite(ETH_LED_pin,LOW);
  } 
  else {
    delay(1);
  }

}

























