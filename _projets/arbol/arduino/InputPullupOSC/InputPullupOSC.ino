#include <ArdOSC.h>

#include <Ethernet.h>
#include <EthernetUdp.h>         
#include <SPI.h>  
#include <EEPROM.h>
#include <PinChangeInt.h>


#define NUMSENSORS 4

//Configurer adresse Ip du Arduino 
#define AIP1 10
#define AIP2 10
#define AIP3 10
#define AIP4 220

//Configurer adresse Ip de destination
#define DIP1 10
#define DIP2 10
#define DIP3 10
#define DIP4 255

//Définir port de destination
#define DESTPORT 8888

// 4 7 
// 14 17
//The Arduino pin numbers corresponding to the analog pins are 14 through 19.
int pinMap[NUMSENSORS] = { 
  4, 7, 14, 17};

int reversePinMap[70] = {
 //  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
  -1,-1,-1,-1, 0,-1,-1, 1,-1,-1,
  -1,-1,-1,-1, 2,-1,-1, 3,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1};

byte mac[] = { 
  0xDE, 0xAD, 0xBE, 0xEF, 0xFD, 0xED };

OSCClient client;
byte destIp[]  = {DIP1, DIP2, DIP3, DIP4 };

int unique_id;
char ReplyBuffer[120];      
EthernetUDP Udp; 

int destPort=DESTPORT;
OSCMessage global_mes;
OSCMessage s[NUMSENSORS];

//void send(char *buffer) {
//  Udp.beginPacket(serverip, 8888);
//  Udp.write(buffer);
//  Udp.endPacket();
//}

void setup(){

  for (int i=0; i<NUMSENSORS ; i++) {
    pinMode(pinMap[i],INPUT_PULLUP);
    PCintPort::attachInterrupt(pinMap[i], &twiddle, RISING);

    s[i].setAddress(destIp, destPort);
    s[i].beginMessage("/ard/msg");
    s[i].addArgInt32(i);

  }   
  
  //*** IP/ID management  ***//  à rentrer dans un if 
  EEPROM.write(0,AIP4); // one-time operation
  unique_id = EEPROM.read(0);
  //**********************//

  mac[5] = unique_id;

  IPAddress ip(AIP1, AIP2, AIP3, unique_id);
  Ethernet.begin(mac,ip);

  global_mes.setAddress(destIp, destPort);
  sprintf(ReplyBuffer, "%i.%i.%i.%i: Setup done",ip[0],ip[1],ip[2],ip[3]);
  global_mes.beginMessage("/ard/msg");
  global_mes.addArgString(ReplyBuffer);
  client.send(&global_mes);
  global_mes.flush(); //object data clear

  //Udp.begin(9999);
  //  sprintf(ReplyBuffer, "msg %i.%i.%i.%i: Setup done\n",ip[0],ip[1],ip[2],ip[3]);
  //send(ReplyBuffer);
}

int valid = 0;

typedef struct Senseur { 
  unsigned long in, out, count; 
} 
Senseur;

struct Senseur magnetometer[NUMSENSORS];

void twiddle() {
  if (PCintPort::pinState == HIGH) {
    magnetometer[reversePinMap[PCintPort::arduinoPin]].count++;
    magnetometer[reversePinMap[PCintPort::arduinoPin]].out=millis();
  }  
  else {
    magnetometer[reversePinMap[PCintPort::arduinoPin]].in=millis();
  }
};

void loop(){
  int sent=0;
  for (int i=0; i<NUMSENSORS ; i++) {
    //    if (magnetometer[i].count>0 && (magnetometer[i].in == magnetometer[i].out)) {
    if (magnetometer[i].count>0 ) {
      // sprintf(ReplyBuffer, "%i %lu %lu %i",i,magnetometer[i].in,magnetometer[i].out,magnetometer[i].count);

//      global_mes.setAddress(destIp, destPort);
//      global_mes.beginMessage("/ard/msg");
//      global_mes.addArgInt32(i);
// global_mes.addArgInt32(magnetometer[i].in);
// global_mes.addArgInt32(magnetometer[i].out);
//      //     global_mes.addArgInt32(magnetometer[i].count);
//
//      client.send(&global_mes);
//      global_mes.flush(); //object data clear
      
      client.send(&s[i]);
      
      magnetometer[i].count=0;
      sent=1;
      //      send(ReplyBuffer);
    }
  }
  if (sent==0) {
    delay(10);
  }
  //      global_mes.setAddress(destIp, destPort);
  //      global_mes.beginMessage("/ard/msg");
  //      global_mes.addArgInt32(8);
  //  
  //      client.send(&global_mes);
  //      global_mes.flush(); //object data clear
  //  delay(500);

}







