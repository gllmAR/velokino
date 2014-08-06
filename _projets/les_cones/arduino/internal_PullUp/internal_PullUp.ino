int pin = 13;
volatile int state = HIGH;

void setup()
{
   Serial.begin(9600);
  pinMode(pin, OUTPUT);
  attachInterrupt(2, blink, CHANGE);
}

void loop()
{
  delay(10);
  digitalWrite(pin,state );
   Serial.println(state);
}

void blink()
{
  state = !state;
}
