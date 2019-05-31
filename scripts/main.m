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
clear; clc;
% Setting up arduino
%%
a = ArduinoSetup('com3','uno');
%load calibrationvalues-31.05.mat
% Initiate variables
dispweights = [0, 0.5, 5, 5.5, 10];
%%
weights = [872, 1100, 3152.34, 3380.37, 5432.67];

%% Calibration of sensors


[r, sysfunc] = createSysFunc(a, dispweights);
%%
conductance = 1./r;
%2. Plot conductance values for increasing weight (prove linearity)
plot(weights./1e3, conductance);
%%
%3. create the function to show weight
profile = createProfile(a);
f = @calculateResistance;
resprofile = arrayfun(f,profile);
%%
kilo = (1./resprofile(1,1))*sysfunc(1) + sysfunc(2)
disp('Done')
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