%%%---------------------------------------------------------------------%%%
%%% main.m                                                              %%%
%%% Version 1.4   19.06.2019                                            %%%
%%% @Petter André Kristiansen                                           %%%
%%% Main function for operating the measurement process                 %%%
%%% Args:                                                               %%%
%%%                                                                     %%%
%%% Functions:                                                          %%%
%%% ArduinoSetup        - Establishes arduino connection and MUX setup  %%%
%%% MUXanalogRead       - Collects input values from MUX shield II      %%%
%%% createSysFunc       - Creates transfer functions for each sensor    %%%
%%% createProfile       - Creates the voltage profile from all sensors  %%%
%%% calculateResistance - Calculates the resistance value of each sensor%%%
%%%                       for each given voltage from "createProfile"   %%%
%%%---------------------------------------------------------------------%%%
%% Setting up the arduino
arduino = ArduinoSetup('com3','uno');
%% Load workspace variables
load('data/24.06_calibration_workspace.mat')
%% Initialize variables
weight = @(gram) 0.5072*gram + 900;
weights2 = [700, 100 + weight(0), 500 + weight(200), 900 + weight(0),...
    weight(4761), 200 + weight(4761), 500 + weight(4761+200), weight(5074.9+4761),...
    500 + weight(5074.9+4761), 700 + weight(5074.9+4761)];
plot(weights2); hold on; plot(weights2,'o');
title('Weight intervals for calibration')
xlabel('Interval #');
ylabel('Weight [g]');
% Vref = [circuit1, circuit2, ... , circuit12];
Vref = [ones(2,2)*3.847, ones(2,2)*3.837, ones(2,2)*3.864, ones(2,2)*3.857, ...
    ones(2,2)*3.856, ones(2,2)*3.849, ones(2,2)*3.88, ones(2,2)*3.831, ...
    ones(2,2)*3.86, ones(2,2)*3.856, ones(2,2)*3.876, ones(2,2)*3.841];
Vref_actual = createProfile(arduino);
% Sensor locations for plotting
hull_pitch = 25;
full_array_distance = [0:62]*hull_pitch;
I_array = logical([1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 ...
    0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1]);
x_axis_sensor_location = full_array_distance(I_array);
%% Calibration of all 48 sensors (For best accuracy)
% Channel 1 is left side, channel 2 is right side
% i = channel y-axis, j = sensor x-axis 
for i = 2:2
    % Calibration for channel number i
    for j = 11:11
        % Calibrate sensor number j
        clc;
        a = 'Calibration of';
        b = [' ','Channel', ' ', num2str(i), ' '];
        c = ['Sensor', ' #', num2str(j), ' '];
        s = [a,b,c];
        disp(s)
        disp('___________________________________')
        [r, sysfunc] = createSysFunc(arduino, weights2, Vref_actual, i, j);
        sysfunc_all{i,j} = sysfunc;
        r_all{i,j} = r;
    end
end
%% Average sysfunc per circuit
circuits = cell(1,length(r_all)/2);
for x = 2:2:length(r_all)
    clear r_cat;
    clear r_avg;
    clear p_avg;
    r_cat = cat(3,r_all{1,(x-1)}, r_all{1,x});
    r_avg = mean(r_cat,3);
    p_avg = polyfit(weights2,1./r_avg,1);
    circuits{1,x/2} = p_avg;
end
disp('Circuit average system functions calculated');
%% 3D-plots
% r(1,1) r(1,2) r(2,1) r(2,2) = circuit{1,1}
% r(1,3) r(1,4) r(2,3) r(2,4) = circuit{1,2}
% r(1,5) r(1,6) r(2,5) r(2,6) = circuit{1,3}
%while 1
N = 20;
w_left = zeros(N,24);
w_right = zeros(N,24);
for sample = 1:N
    v = createProfile(arduino);
    r = arrayfun(@calculateResistance, v, Vref_actual);
    for i = 1:length(w_left)
        w_left(sample,i) =  ((1./r(1, i))./sysfunc_all{1,i}(1));
        w_right(sample,i) = ((1./r(2, i))./sysfunc_all{2,i}(1));
    end
end
%  - sysfunc_all{1,i}(2)
%  - sysfunc_all{2,i}(2)
w_left_avg = mean(w_left, 1);
w_right_avg = mean(w_right, 1);
w_profile = [w_right;w_left];

%w_left_avg(w_left_avg<0) = 0;
%w_right_avg(w_right_avg<0) = 0;
% 2D-plots
figure(4);
%clf;
subplot(2,2,1);
title('Left channel');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_left_avg, 'b'); 
plot(x_axis_sensor_location, w_left_avg, 'or'); 
ylim([-3000,10000]);
grid on;

subplot(2,2,2);
title('Right channel');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_right_avg, 'b'); 
plot(x_axis_sensor_location, w_right_avg, 'or');
ylim([-3000,10000]);
grid on;

subplot(2,2,[3 4]);
title('Both channels');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_left_avg, 'b');
plot(x_axis_sensor_location, w_left_avg, 'ob');
plot(x_axis_sensor_location, w_right_avg, 'r');
plot(x_axis_sensor_location, w_right_avg, 'or');
ylim([-3000,10000]);
grid on;
drawnow;
total_w = (sum(w_left_avg) + sum(w_right_avg))/1000
%end
%% Interpolation test
figure(1);
clf;
x_axis_sensor_location_xq = 0:1/length(x_axis_sensor_location):x_axis_sensor_location(1,end);
vq1 = interp1(x_axis_sensor_location,w_left_avg,x_axis_sensor_location_xq);
plot(x_axis_sensor_location_xq,vq1)
%% Testing spline method for interpolation
figure(1);
X = 1:length(w_profile);
XX = 1:1/length(X):length(X);
% Left channel plot
YY = spline(X,w_profile(2,:),XX);
plot(X,w_profile(2,:),'o',XX,YY)

title('Ski profile')
ylabel('weight [g]')
xlabel('Sensor #')
%stem(w_prof(1,1:end),'b'); hold on;
%stem(w_prof(2,1:end), 'g');
%spline(w_prof(2,1:end), 'r');

figure(2);
profile = padarray(w_profile,[1,1], 'both');
surf(profile);
colormap(winter)
%% Removing 200g for polyfit test
% Circuit 1
w = weights2;
c2_test17 = 1./r17;
c2_test18 = 1./r18;
c2_test28 = 1./r28;
f2_17 = polyfit(w,c2_test17,1);
f2_18 = polyfit(w,c2_test18,1);
f2_28 = polyfit(w,c2_test28,1);
figure(2);
plot(w,f2_17(1)*w + f2_17(2),'-r'); hold on
plot(w,f2_18(1)*w + f2_18(2),'-g');
plot(w,f2_28(1)*w + f2_28(2),'-b');
plot(w,p2_avg(1)*w + p2_avg(2),'-c');
%scatter(w,c1_test12,'g'); scatter(w,c1_test22,'b'); 
%scatter(weights2,1./r22); hold on; scatter(weights2,1./r21); scatter(weights2,1./r12);...
%plot(weights2,sysfunc21(1)*weights2 + sysfunc21(2),'-');...
scatter(w,1./circuit2_avg,'c');
%plot(weights2,sysfunc21(1)*weights2 + sysfunc21(2));...
%plot(weights2,sysfunc12(1)*weights2 + sysfunc12(2));
legend('sysfunc_{s1}','sysfunc_{s2}','sysfunc_{s3}','sysfunc_{avg}','avg calibration values','Orientation','horizontal')
hold off;
title('Circuit 2 average linefit');
xlabel('Weights [g]');
ylabel('Conductivity [C]')
%% Comparing two circuits
figure(3);
plot(w,p2_avg(1)*w + p2_avg(2),'-c'); hold on
plot(w,p1_avg(1)*w + p1_avg(2),'-r');
hold off;
title('Comparing linearity circuit 1 and circuit 2');
xlabel('Weights [g]');
ylabel('Conductivity [C]');
legend('Circuit 2','Circuit 1','Orientation','horizontal');
grid on;
%% Saving the data
save('data/31mai')
filename = 'data/31mai-calibration-test';
xlswrite(filename,profile);
%% Test sampling over time
for i=1:sample
    v(i) = arduino.readVoltage('A2');
    v2(i) = arduino.readVoltage('A1');
end
%plot(1:samples, v)
%min_v = min(v);
%max_v = max(v);
%diff_v = max_v - min_v;
%title('500g: V_{diff} = 0.0147V, V_{avg} = 3.4383V');
%xlabel('Samples');
%ylabel('Volt');