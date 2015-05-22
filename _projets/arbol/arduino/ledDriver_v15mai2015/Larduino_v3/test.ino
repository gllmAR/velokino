void test() {
    digitalWrite(TEST_LED_pin,HIGH);

  for(int  x = 0 ; x <= NUMLEDS ; x++) {
    strip0[x].setRGB(127,0,0);
    strip1[x].setRGB(127,0,0);
    strip2[x].setRGB(127,0,0);
 //   strip3[x].setRGB(127,0,0);
  }
  digitalWrite(LP0,HIGH);
  digitalWrite(LP1,HIGH);
  digitalWrite(LP2,HIGH);
  digitalWrite(LP3,HIGH);
  FastLED.show();
  delay(test_time); 

  for(int  x = 0 ; x <= NUMLEDS ; x++) {

    strip0[x].setRGB(0,127,0);
    strip1[x].setRGB(0,127,0);
    strip2[x].setRGB(0,127,0);
 //   strip3[x].setRGB(0,127,0);
  }
  FastLED.show();
  delay(test_time); 

  for(int  x = 0 ; x <= NUMLEDS; x++) {
    strip0[x].setRGB( 0,0,127);
    strip1[x].setRGB( 0,0,127);
    strip2[x].setRGB( 0,0,127);
 //   strip3[x].setRGB( 0,0,127);
  }
  FastLED.show();
  delay(test_time); 

  for(int  x = 0 ; x <= NUMLEDS; x++) {
    strip0[x].setRGB( 127,127,127);
    strip1[x].setRGB( 127,127,127);
    strip2[x].setRGB( 127,127,127);
 //   strip3[x].setRGB( 127,127,127);
  }
  digitalWrite(LP0,LOW);
  digitalWrite(LP1,LOW);
  digitalWrite(LP2,LOW);
  digitalWrite(LP3,LOW);
  FastLED.show();
  
  delay(test_time*2); 
  for(int  x = 0 ; x <= NUMLEDS; x++) {
    strip0[x].setRGB( 0,0,0);
    strip1[x].setRGB( 0,0,0);
    strip2[x].setRGB( 0,0,0);
 //   strip3[x].setRGB( 0,0,0);
  }
  FastLED.show();
  digitalWrite(TEST_LED_pin,LOW);

}
