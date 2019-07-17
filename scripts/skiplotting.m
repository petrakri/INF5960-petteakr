%%% Creation of plots for ski profiles %%%
%%% @ Petter Andre Kristiansen         %%%

load('data/0107_finished_data.mat');
%%
% 1. Select ski to plot from

%fischer812_1 = ski_data_0107{1,3};

% 2. Modify the x-axis
I_array = logical([1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1]);
I_between = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
hull_pitch = 25;
full_array_distance = [0:62]*hull_pitch;
x_axis_sensor_location = full_array_distance(I_array);
between = full_array_distance(I_between);

%%% Choose ski
ski_data = ski_data_fischer812_1{2,1};
total_weight = ski_data_fischer812_1{5,1};

%%% Create arrays for plotting
ski_right_front = ski_data(1,1:length(ski_data)/2);
ski_right_back = ski_data(1,length(ski_data)/2+1:end);
ski_left_front = ski_data(2,1:length(ski_data)/2);
ski_left_back = ski_data(2,length(ski_data)/2+1:end);
ski_right = [ski_right_front, zeros(1,27), ski_right_back];
ski_left = [ski_left_front, zeros(1,27), ski_left_back];
x_axis = [x_axis_sensor_location(1:12), between, x_axis_sensor_location(13:end)];

%ski_data_fischer_x{1,measurement} = w_profile_avg;
%ski_data_fischer_x{2,measurement} = w_profile;
%ski_data_fischer_x{3,measurement} = w_left_avg;
%ski_data_fischer_x{4,measurement} = w_right_avg;
%ski_data_fischer_x{5,measurement} = w_total;

plot(x_axis,ski_right*9.81); hold on;
plot(x_axis,ski_left*9.81); grid on;
title('Ski profile');
xlabel('Sensor location [mm]');
ylabel('Sensor load [N]');
%plot(between,zeros(1,length(between)));
%stairs(x_axis_sensor_location(13+between:end), ski_profile_left(13+between:end));