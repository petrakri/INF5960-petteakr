load calibratedValues.mat
load SavedValues/50kgRossignolKlassisk.mat
values_1 = values;
load SavedValues/firstTryRedLine195kgCold190.mat
values_2 = values;

close all


figure(1)
subplot(211)
stem(values_1)
subplot(212)
stem(values_2)

indx_1 = values_1 < 0.2;
indx_2 = values_2 < 0.5;


R2 = 1e6;
Vin = 5;
R_1 = R2*Vin./values_1 - R2;
R_2 = R2*Vin./values_2 - R2;

% R_1(isinf(R_1)) = 0.0001;
% R_1(isinf(R_1)) = 0.0001;

figure(2)
subplot(211)
stem(1./R_1)
subplot(212)
stem(1./R_2)

calibrated_1 = (((1./R_1)-bF)./aF)*9.81;
calibrated_2 = (((1./R_2)-bF)./aF)*9.81;

calibrated_test = (((1./(R2*Vin./values_1 - R2))-bF)./aF)*9.81;

calibrated_1(indx_1) = 0;
%calibrated_2(indx_2) = 0;

for i = 1:length(calibrated_1)
    calibrated_1_reversed(i) = calibrated_1(end-i+1);
end

figure(3)
subplot(211)
stem(calibrated_1)
subplot(212)
stem(calibrated_2)

calibrated_1_reversed_corrected = calibrated_1_reversed;
temp = calibrated_1_reversed_corrected(14);
calibrated_1_reversed_corrected(14) = calibrated_1_reversed_corrected(13); 
calibrated_1_reversed_corrected(13) = temp;
figure(4)
subplot(211)
stem(calibrated_1_reversed)
xlabel('Sensor');
ylabel('Force (N)');
subplot(212)
stem(calibrated_1_reversed_corrected);
xlabel('Sensor');
ylabel('Force (N)');

figure(5)
stem([calibrated_1_reversed])
xlabel('Sensor');
ylabel('Kraft (N)');
title('Trykk bakski');