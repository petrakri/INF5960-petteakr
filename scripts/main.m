%%%-------------------------------------------------------------------%%%
%%% main.m                                                            %%%
%%% Version 1.2   27.05.2019                                          %%%
%%% @Petter Andr� Kristiansen                                         %%%
%%% Main function for operating the measurement process               %%%
%%% Args:                                                             %%%
%%%                                                                   %%%
%%% Functions:
%%% ArduinoSetup      - Establishes arduino connection and MUX setup  %%%
%%% MUXanalogRead     - Collects input values from MUX shield II      %%%
%%% CalibrateSensors  - Creates transfer functions for each sensor    %%%
%%% 
%%%-------------------------------------------------------------------%%%
clear all; clc;
% Setting up arduino
a = ArduinoSetup('com3','uno');

% Initiate variables
weights = [0.5, 1.5, 2.5, 3.5, 4.5];
samples = 100;

%% Calibration of sensors

%Find the lowest value from the profile. The loaded sensor


%1. create analytical system respons to calculate resistance value
Rflex = Rfb * (Vin - Vref) / (Vref - Vout);
gain = (Rfb/Rflex);
conductance = 1./Rflex;

%2. Plot conductance values for increasing weight (prove linearity)

%3. polyfit to create system response eq.

%4. save equations for use with system
%% Resistance to weight transfer function
%1. create function to take current voltage value and return weight


%% Create ski profile
profile = createProfile(a);
profile = padarray(profile,[3,3], 'both');
h = surfl(profile);
%colormap(pink)
%shading interp
disp('Done')

%% Saving the data
save('data/31mai')
filename = 'data/31mai-calibration-test';
xlswrite(filename,profile);

%% Test sampling over time
for i=1:samples
    v(i) = a.readVoltage('A2');
    v2(i) = a.readVoltage('A1');
end
%plot(1:samples, v)
%min_v = min(v);
%max_v = max(v);
%diff_v = max_v - min_v;
%title('500g: V_{diff} = 0.0147V, V_{avg} = 3.4383V');
%xlabel('Samples');
%ylabel('Volt');
%% Calibration sample each sensor ~10 times for accurate voltage read with mean

calibrationValues = calibrateSensors(a, readingPin);