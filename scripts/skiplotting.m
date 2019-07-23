%%% Creation of plots for ski profiles %%%
%%% @ Petter Andre Kristiansen         %%%

load('data/0107_finished_data.mat');
%%
% 1. Actual loaded weight
w_actual = 40595/1000;


% 2. Modify the x-axis
I_array = logical([1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1]);
I_between = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
hull_pitch = 25;
full_array_distance = [0:62]*hull_pitch;
x_axis_sensor_location = full_array_distance(I_array);
between = full_array_distance(I_between);
x_axis = [x_axis_sensor_location(1:12), between, x_axis_sensor_location(13:end)];
%%% Choose ski
%fischer812_1 = ski_data_0107{1,3};
ski_right = zeros(10,51);
ski_left = zeros(10,51);
for i = 1:4
    for j = 1:10
    ski_data = ski_data_0107{i,3}{2,j};
    total_weight = ski_data_0107{i,3}{5,j};
    ski_data_avg = ski_data_0107{i,3}{1,j};

    %%% Create arrays for plotting
    ski_data_avg = [ski_data_avg(1:length(ski_data)/2), zeros(1,27), ski_data_avg(length(ski_data)/2+1:end)];
    ski_right_front = ski_data(1,1:length(ski_data)/2);
    ski_right_back = ski_data(1,length(ski_data)/2+1:end);
    ski_left_front = ski_data(2,1:length(ski_data)/2);
    ski_left_back = ski_data(2,length(ski_data)/2+1:end);
    ski_right(j,:) = [ski_right_front, zeros(1,27), ski_right_back];
    ski_left(j,:) = [ski_left_front, zeros(1,27), ski_left_back];
    
    %ski_profile = [ski_right; ski_left];
    %ski_data_fischer_x{1,measurement} = w_profile_avg;
    %ski_data_fischer_x{2,measurement} = w_profile;
    %ski_data_fischer_x{3,measurement} = w_left_avg;
    %ski_data_fischer_x{4,measurement} = w_right_avg;
    %ski_data_fischer_x{5,measurement} = w_total;
    end
    ski_right = mean(ski_right,1);
    ski_left = mean(ski_left,1);
    % Heat maps
    figure('Renderer', 'painters', 'Position', [10 10 1400 600]);
    z = zeros(1,length(ski_right));
    profile = [z; ski_right;ski_left; z];
    colormap(hot)
    surf(profile);
    shading interp
    view(2);
    xlim([1 51]);
    xlabel('Sensor index');
    ax = gca;
    set(gca,'ytick',[])
    set(gca,'yticklabel',[])
    if i < 3
       title(['812\_', num2str(i)])
    else
       title(['902\_', num2str(i-2)])
    end
    outerpos = ax.OuterPosition;
    ti = ax.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3);
    ax_height = outerpos(4) - ti(2) - ti(4);
    ax.Position = [left bottom ax_width ax_height];
end
%% Scatter plot of weights
x = ones(1,10);
weights = zeros(4,10);
for j = 1:4
    for i = 1:10
        weights(j,i) = ski_data_0107{j,3}{5,i};
    end
end
figure('Renderer', 'painters', 'Position', [10 10 1000 900]);
subplot(2,2,1);
boxplot(weights(1,:));
title('Fischer 812\_1','FontSize', 12);
ylabel('Load [Kg]','FontSize', 12);
xlabel('All weights','FontSize', 12)
grid on;
pos = get(gca, 'Position');
pos(1) = 0.06;
pos(3) = 0.4;
set(gca, 'Position', pos)
ylim([41 51]);

subplot(2,2,2);
boxplot(weights(2,:));
title('Fischer 812\_2','FontSize', 12);
ylabel('Load [Kg]','FontSize', 12);
xlabel('All weights','FontSize', 12);
grid on;
pos = get(gca, 'Position');
pos(1) = 0.6;
pos(3) = 0.394;
set(gca, 'Position', pos)
ylim([41 51]);

subplot(2,2,3);
boxplot(weights(3,:));
title('Fischer 902\_1','FontSize', 12);
ylabel('Load [Kg]','FontSize', 12);
xlabel('All weights','FontSize', 12);
grid on;
pos = get(gca, 'Position');
pos(1) = 0.06;
pos(3) = 0.4;
set(gca, 'Position', pos)
ylim([41 51]);

subplot(2,2,4);
boxplot(weights(4,:));
title('Fischer 902\_2','FontSize', 12);
ylabel('Load [Kg]','FontSize', 12);
xlabel('All weights','FontSize', 12);
grid on;
pos = get(gca, 'Position');
pos(1) = 0.6;
pos(3) = 0.394;
set(gca, 'Position', pos)
ylim([41 51]);
suptitle('Box plot of measured weights');
%% Ski profile plots
figure('Renderer', 'painters', 'Position', [10 10 1100 900]);

%clf;
subplot(3,2,1);
title('Channel 1','FontSize', 12);
ylabel('Load [N]','FontSize', 12);
xlabel('Sensor location [mm]','FontSize', 12);
hold all;
plot(x_axis, ski_left*9.81, 'b'); 
plot(x_axis, ski_left*9.81, 'or'); 
ylim([-300*9.81,9000*9.81]);
grid on;

subplot(3,2,2);
title('Channel 2','FontSize', 12);
ylabel('Load [N]','FontSize', 12);
xlabel('Sensor location [mm]','FontSize', 12);
hold all;
plot(x_axis, ski_right*9.81, 'b'); 
plot(x_axis, ski_right*9.81, 'or');
ylim([-300*9.81,9000*9.81]);
grid on;


subplot(3,2,[3 4]);
title(['Ski profile 2D, both channels. Summed weight: ', num2str(total_weight), ' kg.'],'FontSize', 12);
ylabel('Load [N]','FontSize', 12);
xlabel('Sensor location [mm]','FontSize', 12);
hold all;
plot(x_axis, ski_left*9.81, 'b-o');
plot(x_axis, ski_right*9.81, 'r-o');
%plot(x_axis, ski_data_avg*9.81, 'k*','LineWidth',2);
legend('Channel 1','Channel 2')
ylim([-300*9.81,9000*9.81]);
grid on;
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];

subplot(3,2,[5 6]);
plot(x_axis, ski_data_avg*9.81, 'b-*','LineWidth',2);
title('Average of both channels','FontSize', 12);
ylabel('Load [N]','FontSize', 12);
xlabel('Sensor location [mm]','FontSize', 12);
legend('Channels average')
ylim([-300*9.81,9000*9.81]);
grid on;
suptitle('Fischer SPEED MAX Classic Plus 812\_2, measurement 1 [40.595 Kg load]');
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];
%suptitle('Subplot Grid Title','Color','red');


%% BOX plot

ski_array = zeros(10,length(ski_data_avg));
for k = 1:10
    ski_data = ski_data_0107{1,3}{1,k};
    ski_data_ext = [ski_data(1:length(ski_data)/2), zeros(1,27), ski_data(length(ski_data)/2+1:end)];
    ski_array(k,:) = ski_data_ext;
    
end
%ski_array_mean = mean(ski_array, 1)
figure('Renderer', 'painters', 'Position', [10 10 1300 600]);
plot(x_axis, mean(ski_array)*9.81,'r-','LineWidth',1.5); hold on;
e = errorbar(x_axis,mean(ski_array*9.81), std(ski_array*9.81), 'LineWidth', 1.5);

title('Standard deviation and mean value of 902\_2, 10 trials','FontSize', 13);
ylabel('Load [N]','FontSize', 13);
xlabel('Sensor location [mm]','FontSize', 13);
legend('Mean value line','Error bars')
e.Color = 'blue';
e.LineStyle = ':';
e.CapSize = 15;
e.Marker = 's';
grid on;
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];

%% Error weight calculation
for i = 1:10
    for j = 1:4
        weights(i,j) = ski_data_0107{j,3}{5,i};
    end
end
clc;
means = mean(weights,1)
errors = 100-(w_actual./weights)*100
mean_errors = mean(errors,1)