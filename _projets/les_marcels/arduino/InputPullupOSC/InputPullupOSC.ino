

#include <Ethernet.h>
#include <EthernetUdp.h>         
#include <SPI.h>  
#include <EEPROM.h>
#include <PinChangeInt.h>
#include <ArdOSC.h>


#define NUMSENSORS 10

int pinMap[NUMSENSORS] = { 
  14, 15, 16, 17, 18, 19, 4 ,5 ,6 ,7};

int reversePinMap[70] = {
  -1,-1,-1,-1, 6, 7, 8, 9,-1,-1,
  -1,-1,-1,-1, 0, 1, 2, 3, 4, 5,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1};

byte mac[] = { 
  0xDE, 0xAD, 0xBE, 0xEF, 0xFD, 0xED };

OSCClient client;
byte destIp[]  = { 
  192, 168, 101, 255 };

int unique_id;
char ReplyBuffer[120];      
EthernetUDP Udp; 

int destPort=8888;
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
    PCintPort::attachInterrupt(pinMap[i], &twiddle, CHANGE);

    s[i].setAddress(destIp, destPort);
    s[i].beginMessage("/ard/msg");
    s[i].addArgInt32(i);

  }   
  //*** IP/ID management  ***//
#define IP1 192
#define IP2 168
#define IP3 101
  EEPROM.write(0,162); // one-time operation
  unique_id = EEPROM.read(0);
  //**********************//

  mac[5] = unique_id;

  IPAddress ip(IP1, IP2, IP3, unique_id);
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
//      //     global_mes.addArgInt32(magnetometer[i].in);
//      //      global_mes.addArgInt32(magnetometer[i].out);
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







