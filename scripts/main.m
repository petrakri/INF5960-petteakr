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
%% Setting up the arduino
a = ArduinoSetup('com3','uno');
%% Set up the weights for calibration
weight = @(gram) 0.5072*gram + 900;
weights = [weight(0), weight(500), weight(5074.5), weight(4761+500), weight(5074.5+4761)];
weights2 = [700, weight(0), 500 + weight(200), 700 + weight(200),...
    weight(4761), 200 + weight(4761), 500 + weight(4761+200), weight(5074.9+4761),...
    500 + weight(5074.9+4761), 700 + weight(5074.9+4761)];
plot(weights2)
title('Weight intervals for calibration')
xlabel('Interval #');
ylabel('Weight [g]');
%% Collect calibration sysfunc and resistance values
[r12, sysfunc] = createSysFunc(a, weights2);
%% Concatenate all sensor resistance values
cat = cat(3,r21(2:end),r22(2:end),r12(2:end));
%% Calculate average resistance from all sensors
circuit1_avg = mean(cat,3);
%% Calculate average polyfit
p1_avg = polyfit(w,1./circuit1_avg,1);
%% Calculate conductance and plot linearity
conductance = 1./r12;
plot(weights2,sysfunc(1)*weights2 + sysfunc(2)); hold on;
scatter(weights2, conductance);
title('Transfer function vs. actual measurements');
xlabel('Weights [g]');
ylabel('Conductance [C]');
legend('Linefit','Measured values')
%% 3. Transform the profile to show resistance
profile = createProfile(a);
f = @calculateResistance;
resprofile = arrayfun(f,profile);
disp('resprofile')
%% w = ( c - b ) / a == ( 1./r - sysfunc(2) ) / sysfunc(1) 
gram = (1./resprofile(1,1) - sysfunc(2)) / sysfunc(1);
disp('Done')
%% Removing 200g for polyfit test
% Circuit 1
w = weights2;
c1_test21 = 1./r21(2:end);
c1_test12 = 1./r12(2:end);
c1_test22 = 1./r22(2:end);
f1_21 = polyfit(w,c_test21,1);
f1_12 = polyfit(w,c_test12,1);
f1_22 = polyfit(w,c_test22,1);
figure(2);
plot(w,f1_21(1)*w + f1_21(2),'-r'); hold on
plot(w,f1_12(1)*w + f1_12(2),'-g');
plot(w,f1_22(1)*w + f1_21(2),'-b');
plot(w,p1_avg(1)*w + p1_avg(2),'-c');
%scatter(w,c1_test12,'g'); scatter(w,c1_test22,'b'); 
%scatter(weights2,1./r22); hold on; scatter(weights2,1./r21); scatter(weights2,1./r12);...
%plot(weights2,sysfunc21(1)*weights2 + sysfunc21(2),'-');...
scatter(w,1./circuit1_avg,'c');
%plot(weights2,sysfunc21(1)*weights2 + sysfunc21(2));...
%plot(weights2,sysfunc12(1)*weights2 + sysfunc12(2));
legend('sysfunc_{s4} -200g','sysfunc_{s3} -200g','sysfunc_{s2} -200g','sysfunc_{avg} -200g','avg calibration values','Orientation','horizontal')
hold off;
title('Average linefit');
xlabel('Weights [g]');
ylabel('Conductivity [C]')
%% Create ski profile
profile = createProfile(a);
profile = padarray(profile,[3,3], 'both');
f = @calculateResistance;
resprofile = arrayfun(f,profile);
h = surfl((resprofile - sysfunc21(2))./sysfunc21(1));
colormap(pink)
shading interp
disp('Done')
%% Saving the data
save('data/31mai')
filename = 'data/31mai-calibration-test';
xlswrite(filename,profile);
%%
save('data/05.06_calibration_r12.mat','r12','weights2','sysfunc')
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