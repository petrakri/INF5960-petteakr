%% linearity test
channel = 2; sensor = 12;

sysfunc = sysfunc_all{channel, sensor};
r       = r_all{channel, sensor};
a       = sysfunc(1);
b       = sysfunc(2);

% Errors
observed = 1./r;
fitted = a*weights2 + b;
clc;
% Standard deviation error calculation
%stderr = (std(1./r))./(sqrt(length(1./r)))


% Maximum deviation error (worst case)
[maxdev_err, ind] = max(abs(observed-fitted))
lin_err = (maxdev_err./fitted(ind))*100

% Standard error from linearity (most likely)
st_err = sqrt( 1./(length(weights2)-2) * (sum( observed - fitted )).^2 )

figure(1);
clf;
plot(weights2, 1./r,'*g');hold on;
plot(weights2, a*weights2 + b, 'r');
plot(weights2, 1./r,'g');
xlabel('Weights [g]');
ylabel('Conductance [c]');
title(['Linearity test, channel: ',num2str(channel),' sensor: ', num2str(sensor)]);
legend('Observed data', 'Fitted data','Location','northwest');
grid on;