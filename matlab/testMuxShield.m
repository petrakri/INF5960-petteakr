eval('ls /dev/ttyA*');
a = arduino('/dev/ttyACM0');

%My version of mayhewlabs analog read code
%Define control pins
S0 = 2;
S1 = 4;
S2 = 6;
S3 = 7;

%Initiate variables
mux0array = ones(1,16);
mux1array = ones(1,16);
mux2array = ones(1,16);

%Setup pins
a.pinMode(S0,'OUTPUT');
a.pinMode(S1,'OUTPUT');
a.pinMode(S2,'OUTPUT');
a.pinMode(S3,'OUTPUT');

for i = 1:length(mux0array)
    j = i-1;
    a.digitalWrite(S0, bitand(j,1));
    a.digitalWrite(S1, bitshift(bitand(j,3),-1));
    a.digitalWrite(S2, bitshift(bitand(j,7),-2));
    a.digitalWrite(S3, bitshift(bitand(j,15),-3));
    
    mux0array(i) = a.analogRead(0);
    mux1array(i) = a.analogRead(1);
    mux2array(i) = a.analogRead(2);
end

mux0array
mux1array
mux2array

delete(a)
delete(gcf)