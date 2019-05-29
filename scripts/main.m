%%%-------------------------------------------------------------------%%%
%%% main.m                                                            %%%
%%% Version 1.2   27.05.2019                                          %%%
%%% @Petter André Kristiansen                                         %%%
%%% Main function for operating the measurement process               %%%
%%% Args:                                                             %%%
%%%                                                                   %%%
%%% Functions:
%%% ArduinoSetup      - Establishes arduino connection and MUX setup  %%%
%%% MUXanalogRead     - Collects input values from MUX shield II      %%%
%%% CalibrateSensors  - Creates transfer functions for each sensor    %%%
%%% 
%%%-------------------------------------------------------------------%%%

% Setting up arduino
a = ArduinoSetup('com3','uno');

% Initiate variables
weights = [0.5, 1.5, 2.5, 3.5, 4.5];
samples = 100;

%% Collect values

figure(1);
[io1, io2, io3] = MUXanalogread(a);
io1_L = io1(1:2:end);
io1_R = io1(2:2:end);
io2_L = io2(1:2:end);
io2_R = io2(2:2:end);
io3_L = io3(1:2:end);
io3_R = io3(2:2:end);
profile = [io1_L, io2_L, io3_L; io1_R, io2_R, io3_R];
profile = padarray(profile,[3,3], 'both');
h = surfl(profile);
colormap(pink)
shading interp

save('data/29mai')
filename = 'data/29mai-3d-test';
xlswrite(filename,profile);
%% Test sampling over time
for i=1:samples
    v(i) = readArduinoVoltage(a, readingPin);
end
plot(1:samples, v)
min_v = min(v);
max_v = max(v);
diff_v = max_v - min_v;
%title('500g: V_{diff} = 0.0147V, V_{avg} = 3.4383V');
xlabel('Samples');
ylabel('Volt');
%% Calibration sample each sensor ~10 times for accurate voltage read with mean

calibrationValues = calibrateSensors(a, readingPin);