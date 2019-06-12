%%%-------------------------------------------------------------------%%%
%%% main.m                                                            %%%
%%% Version 1.3   10.06.2019                                          %%%
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
%% Setting up the arduino
arduino = ArduinoSetup('com3','uno');
%% Load workspace variables
load('11.06_calibration_workspace.mat')
%% Set up the weights for calibration
weight = @(gram) 0.5072*gram + 900;
weights2 = [700, 100 + weight(0), 500 + weight(200), 900 + weight(0),...
    weight(4761), 200 + weight(4761), 500 + weight(4761+200), weight(5074.9+4761),...
    500 + weight(5074.9+4761), 700 + weight(5074.9+4761)];
plot(weights2)
title('Weight intervals for calibration')
xlabel('Interval #');
ylabel('Weight [g]');
%% Calibration of all 48 sensors (For best accuracy)
% Channel 1 is left side, channel 2 is right side
sysfunc_all = cell(2,24);
r_all = cell(2,24);
%%
for i = 1:2
    % Calibration for channel number i
    for j = 23:24
        % Calibrate sensor number j
        clc;
        a = 'Calibration of';
        b = [' ','Channel', ' ', num2str(i), ' '];
        c = ['Sensor', ' #', num2str(j), ' '];
        s = [a,b,c];
        disp(s)
        disp('___________________________________')
        [r, sysfunc] = createSysFunc(arduino, weights2, i, j);
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
disp('DONE')
%% Sensor locations for plotting
hull_pitch = 25;
x = 18;
full_array_distance = [0:62]*hull_pitch;
I_array = logical([1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 ...
    0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1]);
x_axis_sensor_location = full_array_distance(I_array);
%% 3D-plots
calcR = @calculateResistance;
counter = 0;
%while 1

%r(r<0) = 0;
%w_profile = zeros(2,24);
% r(1,1) r(1,2) r(2,1) r(2,2) = circuit{1,1}
% r(1,3) r(1,4) r(2,3) r(2,4) = circuit{1,2}
% r(1,5) r(1,6) r(2,5) r(2,6) = circuit{1,3}

w_left = zeros(5,12);
w_right = zeros(5,12);
for samples = 1:5
    v = createProfile(arduino);
    r = arrayfun(calcR,v);
    sensor_idx = 1;
    for i = 1:length(sysfunc_all)
        for j = 1:1
            w_left(samples,sensor_idx) = (1./r(1, sensor_idx) - sysfunc_all{1,i}(2))./sysfunc_all{1,i}(1) ;
            %w_right(samples,sensor_idx) = (1./r(2, sensor_idx) - circuits{1,i}(2))./circuits{1,i}(1) ;
            sensor_idx = sensor_idx + 1;
        end
    end
end
w_left_avg = mean(w_left, 1);
%w_right_avg = mean(w_right, 1);
w_left(w_left<0) = 0;
%w_right(w_right<0) = 0;
%w_profile = [w_right;w_left];
disp('DONE')
% 2D-plots
figure(4);
clf;
subplot(2,2,1);
hold all;
title('Left channel');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
plot(x_axis_sensor_location, w_left_avg, 'b'); 
plot(x_axis_sensor_location, w_left_avg, 'or'); 
ylim([-3000,7000])

subplot(2,2,2);
%title('Right channel');
%ylabel('Weight [g]');
%xlabel('Sensor location [mm]');
%hold all;
%plot(x_axis_sensor_location, w_right_avg, 'b'); 
%plot(x_axis_sensor_location, w_right_avg, 'or');
%ylim([-3000,7000])

subplot(2,2,[3 4]);
title('Both channels');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_left_avg, 'b');
plot(x_axis_sensor_location, w_left_avg, 'ob');
%plot(x_axis_sensor_location, w_right_avg, 'r');
%plot(x_axis_sensor_location, w_right_avg, 'or');
ylim([-3000,7000])
drawnow;
%end
%%
%w(w<0.01) = 0;
%w_prof = [zeros(2,3),w(:,1:12),zeros(2,19),w(:,12:end),zeros(2,3)];

figure(1);
X = 1:length(w_prof);
XX = 1:1/length(X):length(X);
% Left channel plot
YY = spline(X,w_prof(1,:),XX);
plot(X,w_prof(1,:),'o',XX,YY)

title('Ski profile')
ylabel('weight [g]')
xlabel('Sensor #')
%stem(w_prof(1,1:end),'b'); hold on;
%stem(w_prof(2,1:end), 'g');
%spline(w_prof(2,1:end), 'r');

figure(2);
profile = padarray(w,[1,1], 'both');
surf(profile);
colormap(winter)

%%
profile = padarray(v,[1,1], 'both');
figure(1);
surfl(profile);
%colormap(pink)
%shading interp
disp('Done')
%% Collect calibration sysfunc and resistance values
[r18, sysfunc18] = createSysFunc(arduino, weights2);
%% Concatenate all sensor resistance values
cat_s2 = cat(3,r17,r18,r28);
%% Calculate average resistance from all sensors
circuit2_avg = mean(cat_s2,3);
%% Calculate average polyfit
p2_avg = polyfit(w,1./circuit2_avg,1);
%% Calculate conductance and plot linearity
conductance = 1./r18;
plot(weights2,sysfunc18(1)*weights2 + sysfunc18(2)); hold on;
scatter(weights2, conductance);
title('Circuit 2, Sensor 3 linefit');
xlabel('Weights [g]');
ylabel('Conductance [C]');
legend('Linefit','Measured values')
%% 3. Transform the profile to show resistance
profile = createProfile(arduino);
f = @calculateResistance;
resprofile = arrayfun(f,profile);
disp('resprofile')
%% w = ( c - b ) / a == ( 1./r - sysfunc(2) ) / sysfunc(1) 
gram = (1./resprofile(1,1) - sysfunc(2)) / sysfunc(1);
disp('Done')
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
%% Create ski profile
profile = createProfile(arduino);
profile = padarray(profile,[3,3], 'both');
f = @calculateResistance;
resprofile = arrayfun(f,profile);
h = surfl((resprofile - sysfunc21(2))./sysfunc21(1));
colormap(pink)
shading interp
disp('Done')
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
%%
save('data/05.06_calibration_r12.mat','r12','weights2','sysfunc')
%% Test sampling over time
for i=1:samples
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