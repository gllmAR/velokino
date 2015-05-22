#define NUMSENSORS 4


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
IPAddress ip(192, 168, 111, 177);
//destination IP
IPAddress outIp(192, 168, 111, 255);

// port de destination
const unsigned int outPort = 9999;
 
// mapping de pin  observer
//The Arduino pin numbers corresponding to the analog pins are 14 through 19.
  
 int pinMap[NUMSENSORS] = { 
  11, 12};
  
  
 int reversePinMap[70] = {
 //0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
  -1,-1,-1,-1,-1,-1,-1, 1,-1,-1,
  -1, 0, 1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
 
  

volatile uint16_t interruptCount=0;

int interuptCountArray[NUMSENSORS]; 

void interruptFunction() {
 interruptCount++;
// interuptCountArray[]++;
}

typedef struct Senseur { 
  unsigned long in, out, count; 
} 
Senseur;

struct Senseur magnetometer[NUMSENSORS];



  
void setup() {
  Ethernet.begin(mac,ip);
    Udp.begin(9999);
    
  for (int i=0; i<NUMSENSORS ; i++) {
     pinMode(pinMap[i],INPUT_PULLUP);
      enableInterrupt(pinMap[i], interruptFunction, CHANGE);
    
    }
    
//  pinMode(12, INPUT_PULLUP);  // Configure the pin as an input, and turn on the pullup resistor.
//                                      // See http://arduino.cc/en/Tutorial/DigitalPins
//  enableInterrupt(12, interruptFunction, CHANGE);
//    
     OSCMessage msg("setupDone");
       
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream 
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message
    


 }




void loop(){
  
  OSCMessage msg("running");
  msg.add((int32_t)interruptCount);     
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream 
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message
  
  delay (10);
}
