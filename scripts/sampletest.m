%% 50 sample test with histograms
samples = 100;
v = zeros(1,samples);
x_axis = linspace(0,samples,samples);
for n = 1:samples
    v(n) = arduino.readVoltage('A0');
    pause(0.1)
end
%%
figure(2);
subplot(211);
title('100 samples variance test')
plot(x_axis, v,'o');
plot(x_axis, v);
xlabel('Samples [n]');
ylabel('Voltage [v]');
legend('100 samples variance test')

subplot(212);
title('Histrogram');
h = histogram(v);
h.BinWidth = 5.000e-04;
xlabel('Voltage [v]');
ylabel('# Occurrences');
legend('Histogram')
suptitle('Loaded [3314.8g]');