%% Time drift test

seconds = 60*5;
interval = 1;
v_1500g = zeros(1,seconds+1);
x_axis = 0:interval:seconds*interval;
for n = 1:length(x_axis)
    tic
    v_1500g(n) = arduino.readVoltage('A0');
    pause(interval-toc)
end
%% Plotting
figure(1);
%plot(x_axis, v_1500g,'g');
plot(x_axis(1:15), v_1500g(1:15),'g'); hold on;
plot(x_axis(15:33), v_1500g(15:33),'r');
plot(x_axis(33:end), v_1500g(33:end),'g');
title('Time-drift test [5 minutes]');
plot([14 14],[3.31 3.36],'b:','LineWidth',1.5);
plot([32 32],[3.31 3.36],'black:','LineWidth',1.5);
xlabel('Seconds [s]');
ylabel('Voltage [v]');
ylim([3.315, 3.35]);
legend('Unstable','Stable','Unstable','14 seconds','32 seconds');