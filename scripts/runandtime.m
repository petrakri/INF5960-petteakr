while 1
N = 1;
w_left = zeros(N,24);
w_right = zeros(N,24);
for sample = 1:N
    v = createProfile(arduino);
    r = arrayfun(@calculateResistance, v, Vref_actual);
    for i = 1:length(sysfunc_all)
        w_left(sample,i) = (1./r(1, i) - sysfunc_all{1,i}(2))./sysfunc_all{1,i}(1) ;
        w_right(sample,i) = (1./r(2, i) - sysfunc_all{2,i}(2))./sysfunc_all{2,i}(1) ;
    end
end
w_left_avg = mean(w_left, 1);
w_right_avg = mean(w_right, 1);
w_profile = [w_right;w_left];

%w_left_avg(w_left_avg<0) = 0;
%w_right_avg(w_right_avg<0) = 0;
% 2D-plots
figure(4);
clf;
subplot(2,2,1);
title('Left channel');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_left_avg, 'b'); 
plot(x_axis_sensor_location, w_left_avg, 'or'); 
ylim([-3000,7000])

subplot(2,2,2);
title('Right channel');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_right_avg, 'b'); 
plot(x_axis_sensor_location, w_right_avg, 'or');
ylim([-3000,7000])

subplot(2,2,[3 4]);
title('Both channels');
ylabel('Weight [g]');
xlabel('Sensor location [mm]');
hold all;
plot(x_axis_sensor_location, w_left_avg, 'b');
plot(x_axis_sensor_location, w_left_avg, 'ob');
plot(x_axis_sensor_location, w_right_avg, 'r');
plot(x_axis_sensor_location, w_right_avg, 'or');
ylim([-3000,7000])
drawnow;
end