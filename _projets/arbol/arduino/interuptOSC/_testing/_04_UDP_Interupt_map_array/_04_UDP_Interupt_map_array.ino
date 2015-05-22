


// Inclure  la  libraty cnmat osc
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>    
#include <OSCMessage.h>




// pour gerer les interupts 
#include <EnableInterrupt.h>

// Definir le type de communication ? UDP
EthernetUDP Udp;


// mac Adresse Arduino (doit etre unique au reseau) 
 byte mac[] = {  
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
  
//Arduino IP
IPAddress ip(10, 10, 10, 151);
//destination IP
IPAddress outIp(10, 10, 10, 255);

// port de destination
const unsigned int outPort = 9999;
 
// mapping de pin  observer
//The Arduino pin numbers corresponding to the analog pins are 14 through 19.
  
// See http://arduino.cc/en/Tutorial/DigitalPins

// Arduino UNO : 4 7 14 17 

#define NUMSENSORS  6

 int pinMap[NUMSENSORS] = { 
  14, 15, 16, 17, 18, 19 };
  
  
 int reversePinMap[70] = {
 //0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
  -1,-1,-1,-1,-1,-1,-1, 1,-1,-1,
  -1,-1,-1,-1, 0, 1, 2, 3, 4, 5,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
 
  

int interuptCountArray[NUMSENSORS]; 
int sendFlag = 0;



void interruptFunction0() {
 interuptCountArray[0]++;
 sendFlag = 1;
}

void interruptFunction1() {
 interuptCountArray[1]++;
 sendFlag = 1;
}

void interruptFunction2() {
 interuptCountArray[2]++;
 sendFlag = 1;
}

void interruptFunction3() {
 interuptCountArray[3]++;
 sendFlag = 1;
}

void interruptFunction4() {
 interuptCountArray[4]++;
 sendFlag = 1;
}


void interruptFunction5() {
 interuptCountArray[5]++;
 sendFlag = 1;
}




  
void setup() {
  Ethernet.begin(mac,ip);
    Udp.begin(9999);
    
  for (int i=0; i<NUMSENSORS ; i++) {
     pinMode(pinMap[i],INPUT_PULLUP);  
     if (i == 0) enableInterrupt(pinMap[i], interruptFunction0, RISING);
     if (i == 1) enableInterrupt(pinMap[i], interruptFunction1, RISING);
     if (i == 2) enableInterrupt(pinMap[i], interruptFunction2, RISING);
     if (i == 3) enableInterrupt(pinMap[i], interruptFunction3, RISING);
     if (i == 4) enableInterrupt(pinMap[i], interruptFunction4, RISING);
     if (i == 5) enableInterrupt(pinMap[i], interruptFunction5, RISING);
   
    
    }
    

     OSCMessage msg("setupDone");
       
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream 
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message
    


 }




void loop(){
  
  if (sendFlag == 1){
    
  OSCMessage msg("running");
  for (int i=0; i<NUMSENSORS ; i++) {
  msg.add((int32_t)interuptCountArray[i]); 
  interuptCountArray[i] = 0;  
  }  
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream 
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message
  sendFlag = 0;
  }
  
  
  
  delay (33);
}
