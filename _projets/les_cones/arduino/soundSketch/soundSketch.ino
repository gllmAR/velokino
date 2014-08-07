//sound start 


int soundPin[] = {0, 9, 11};


void setup ()
{
for (int x=1; x <= 3; x++) {
pinMode (soundPin[x], OUTPUT);
}



}

void loop()



{
croissant();
decroissant();
}



 // Note Décroissante
  //T = fréquence de départ
  //T > X = Fréquence de fin
  //T = T - Y = rampe et temps 
  void decroissant() {
   for (int t=1000; t>=800; t=t-200){
    for (int x=1; x <= 3; x++){ //to5
      tone(soundPin[x], t);
      delay(115);
      noTone(soundPin[x]);
      delay(1);
    }
   }
  }
  
  void croissant() {
   //Note Croissante
   //T = fréquence de départ
  //T < X = Fréquence de fin
  //T = T - Y = rampe et temps 
   for (int t=1450; t<=1464; t=t+12){
    for (int x=1; x <= 3; x++){ //to5
      tone(soundPin[x], t);
      delay(115);
      noTone(soundPin[x]);
      delay(1);
    }
   }
  }

   
   


