int sensor=A0; 
int dig_out;
float millivolt;
void setup()
{
pinMode(sensor,INPUT); // sets A0 as input
}

void loop()
{
dig_out=analogRead(sensor); // reads the input voltage
millivolt=(dig_out*4.882);  // converts the reading to millivolt
}  
