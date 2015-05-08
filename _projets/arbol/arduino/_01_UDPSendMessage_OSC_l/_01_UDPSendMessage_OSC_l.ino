
// Inclure  la  libraty cnmat osc
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>    
#include <OSCMessage.h>

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
#define NUMSENSORS 4

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
  
 char ReplyBuffer[120];  
  
void setup() {
  Ethernet.begin(mac,ip);
    Udp.begin(8888);
    

 for (int i=0; i<NUMSENSORS ; i++) {
    pinMode(pinMap[i],INPUT_PULLUP);
    PCintPort::attachInterrupt(pinMap[i], &twiddle, RISING);
 }
  OSCMessage msg("setup Done");
 // msg.add((int32_t)analogRead(0));
  
  Udp.beginPacket(outIp, outPort);
    msg.send(Udp); // send the bytes to the SLIP stream
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message

}


void loop(){
  //the message wants an OSC address as first argument
  OSCMessage msg("/analog/0");
  msg.add((int32_t)analogRead(0));
  
  Udp.beginPacket(outIp, outPort);
    msg.send(Udp); // send the bytes to the SLIP stream
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message

  delay(20);
}
