
// Inclure  la  libraty cnmat osc
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>    
#include <OSCMessage.h>


// Definir le type de communication ? UDP
EthernetUDP Udp;

// pour gerer les interupts 
#include <EnableInterrupt.h>

//#define ARDUINOPIN 12;




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
  
  

volatile uint16_t interruptCount=0;


void interruptFunction() {
  interruptCount++;
}

  
void setup() {
  Ethernet.begin(mac,ip);
    Udp.begin(9999);
    
   pinMode(12, INPUT_PULLUP);  // Configure the pin as an input, and turn on the pullup resistor.
                                      // See http://arduino.cc/en/Tutorial/DigitalPins
  enableInterrupt(12, interruptFunction, CHANGE);
    
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
