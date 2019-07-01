%%%---------------------------------------------------------------------%%%
%%% main.m                                                              %%%
%%% Version 2.0   27.06.2019                                            %%%
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
load('data/27.06_measurement_workspace.mat')
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
I_array = logical([1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1]);
x_axis_sensor_location = full_array_distance(I_array);
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
%% Setup data saving
ski_data_0107 = cell(4,3);
ski_data_fischer812_1 = cell(5,10);
ski_data_fischer812_2 = cell(5,10);
ski_data_fischer902_1 = cell(5,10);
ski_data_fischer902_2 = cell(5,10);
for i = 1:4
    ski_data_0107{i,1} = x_axis_sensor_location;
    ski_data_0107{i,2} = datetime('today');
end
%% 3D-plots
% r(1,1) r(1,2) r(2,1) r(2,2) = circuit{1,1}
% r(1,3) r(1,4) r(2,3) r(2,4) = circuit{1,2}
% r(1,5) r(1,6) r(2,5) r(2,6) = circuit{1,3}
skis = ["812_1", "812_2", "902_1", "902_2"];
for measurement = 1:10
    for ski = 1:4
        s = skis(ski);
        disp(s)
        pause;
        N = 2;
        w_left = zeros(N,24);
        w_right = zeros(N,24);
        v = zeros(N,24);
        r = zeros(N,24);
        
        for sample = 1:N
            v = createProfile(arduino);
            r = arrayfun(@calculateResistance, v, Vref_actual);
            for i = 1:length(w_left)
                w_left(sample,i) =  ((1./r(1, i) - sysfunc_all{1,i}(2))./sysfunc_all{1,i}(1));
                w_right(sample,i) = ((1./r(2, i) - sysfunc_all{2,i}(2))./sysfunc_all{2,i}(1));
            end
        end
        
        w_left_avg = mean(w_left, 1);
        w_right_avg = mean(w_right, 1);
        w_left_avg(w_left_avg<-200) = 0;
        w_right_avg(w_right_avg<-200) = 0;
        w_profile = [w_right_avg;w_left_avg];
        w_profile_avg = mean(w_profile,1);
        
        if ski == 1
            ski_data_fischer812_1{1,measurement} = w_profile_avg;
            ski_data_fischer812_1{2,measurement} = w_profile;
            ski_data_fischer812_1{3,measurement} = w_left_avg;
            ski_data_fischer812_1{4,measurement} = w_right_avg;
            ski_data_fischer812_1{5,measurement} = w_total;
        elseif ski == 2
            ski_data_fischer812_2{1,measurement} = w_profile_avg;
            ski_data_fischer812_2{2,measurement} = w_profile;
            ski_data_fischer812_2{3,measurement} = w_left_avg;
            ski_data_fischer812_2{4,measurement} = w_right_avg;
            ski_data_fischer812_2{5,measurement} = w_total;
        elseif ski == 3
            ski_data_fischer902_1{1,measurement} = w_profile_avg;
            ski_data_fischer902_1{2,measurement} = w_profile;
            ski_data_fischer902_1{3,measurement} = w_left_avg;
            ski_data_fischer902_1{4,measurement} = w_right_avg;
            ski_data_fischer902_1{5,measurement} = w_total;
        elseif ski == 4
            ski_data_fischer902_2{1,measurement} = w_profile_avg;
            ski_data_fischer902_2{2,measurement} = w_profile;
            ski_data_fischer902_2{3,measurement} = w_left_avg;
            ski_data_fischer902_2{4,measurement} = w_right_avg;
            ski_data_fischer902_2{5,measurement} = w_total;        
        end
    end
end
ski_data_0107{1,3} = ski_data_fischer812_1;
ski_data_0107{2,3} = ski_data_fischer812_2;
ski_data_0107{3,3} = ski_data_fischer902_1;
ski_data_0107{4,3} = ski_data_fischer902_2;
%  
%  
%%

w_left_avg = mean(w_left, 1);
w_right_avg = mean(w_right, 1);

w_left_avg(w_left_avg<-200) = 0;
w_right_avg(w_right_avg<-200) = 0;
w_profile = [w_right_avg;w_left_avg];
w_profile_avg = mean(w_profile,1);
% 2D-plots
figure();
%clf;
subplot(2,2,1);
title('Left channel');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_left_avg, 'b'); 
plot(x_axis_sensor_location, w_left_avg, 'or'); 
ylim([-1000,12000]);
grid on;

subplot(2,2,2);
title('Right channel');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_right_avg, 'b'); 
plot(x_axis_sensor_location, w_right_avg, 'or');
ylim([-1000,12000]);
grid on;

subplot(2,2,[3 4]);
title('Both channels');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_left_avg, 'b');
plot(x_axis_sensor_location, w_right_avg, 'r');
plot(x_axis_sensor_location, w_profile_avg, 'g','LineWidth',2);
legend('Left channel','Right channel', 'Channel average')
ylim([-1000,12000]);
grid on;
suptitle('Fischer SPEED MAX Classic Plus 812 #2 [40Kg]');
%suptitle('Subplot Grid Title','Color','red');
w_total = (sum(w_left_avg) + sum(w_right_avg))/1000;

%% plot data

%plot(ski_data_2706{1,1}, ski_data_2706{1,3}{1,1});

%% moving average test
figure(1);
Z1 = smooth(w_profile(1,:),2);
Z2 = smooth(w_profile(2,:),2);
plot(x_axis_sensor_location,Z1); hold on; plot(x_axis_sensor_location, Z2)
%% Testing spline method for interpolation
figure(7);
prof = w_profile(2,:);
X = 1:length(prof);
XX = 1:1/101:X(end);

YY = spline(x_axis_sensor_location,prof);


plot(x_axis_sensor_location,prof,'o');

title('Ski profile')
ylabel('weight [g]')
xlabel('Sensor #')
%stem(w_prof(1,1:end),'b'); hold on;
%stem(w_prof(2,1:end), 'g');
%spline(w_prof(2,1:end), 'r');
%%
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