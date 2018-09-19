clear all
close all
%  1 lb = 0.45359237
% 25 lb = 11.3398093 kilograms
%Resistor 22 = 0.99
%Resistor 28 = 0.973

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% CALIBRATION ONE : Sensor 100lb id: 0,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%weight_1(1) = 0;
weight_1(1) = 5;%kg
weight_1(2) = 10;%kg
weight_1(3) = 15;%kg
weight_1(4) = 20;%kg

weight_1(5) = 30;
weight_1(6) = 45;%kg
%weight_1(6) = 44.9;

%measuredValue_1(1) = 0.001;
measuredValue_1(1) = 4.5345;
measuredValue_1(2) = 4.719;
measuredValue_1(3) = 4.8008;
measuredValue_1(4) = 4.8436;
measuredValue_1(5) = 4.879;
measuredValue_1(6) = 4.912;
%measuredValue_1(6) = 4.9047;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% CALIBRATION TWO : Sensor 100lb id: 1,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
weight_2(1) = 5;%kg
weight_2(2) = 10;%kg
weight_2(3) = 15;%kg
weight_2(4) = 20;%kg

weight_2(5) = 30;
weight_2(6) = 44.9;%kg
%weight_1(6) = 44.9;

measuredValue_2(1) = 4.4917;
measuredValue_2(2) = 4.7019;
measuredValue_2(3) = 4.7862;
measuredValue_2(4) = 4.8253;
measuredValue_2(5) = 4.8741;
measuredValue_2(6) = 4.9084;
%measuredValue_1(6) = 4.9047;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% CALIBRATION TWO : Sensor 100lb id: 3,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
weight_3(1) = 5;%kg
weight_3(2) = 10;%kg
weight_3(3) = 15;%kg
weight_3(4) = 20;%kg
weight_3(5) = 30;
weight_3(6) = 45;%kg

measuredValue_3(1) = 4.5088;
measuredValue_3(2) = 4.7129;
measuredValue_3(3) = 4.7984;
measuredValue_3(4) = 4.8424;
measuredValue_3(5) = 4.8851;
measuredValue_3(6) = 4.9157;


R2_1 = 1e6;
R2_2 = 1e6;
R2_3 = 1e6;
R2_4 = 1e6;
R2_5 = 1e6;
R2_6 = 1e6;
R2_7 = 1e6;
Vin = 5;

R_1 = R2_1*Vin./measuredValue_1 - R2_1;
R_2 = R2_2*Vin./measuredValue_2 - R2_2;
R_3 = R2_3*Vin./measuredValue_3 - R2_3;
% R_4 = R2_4*Vin./measuredValue_4 - R2_4;
% R_5 = R2_5*Vin./measuredValue_5 - R2_5;
% R_6 = R2_6*Vin./measuredValue_6 - R2_6;
% R_7 = R2_7*Vin./measuredValue_7 - R2_7;

%weight = mean([weight_1 ; weight_2 ; weight_3 ; weight_4; weight_5; weight_6; weight_7])
figure(1)
%subplot(211)
plot(weight_1, 1./R_1,'-*r')
hold on
plot(weight_2, 1./R_2,'-*g')
hold on
plot(weight_3, 1./R_3,'-*k');
legend('Sensor 0', 'Sensor 1','Sensor 3');
%title('Resistor variance not accounted for');
xlabel('Weight kg');
ylabel('Conductance (1/R)');

figure(2)
plot(weight_1*9.81, 1./R_1,'-*r')
hold on
plot(weight_2*9.81, 1./R_2,'-*g')
hold on
plot(weight_3*9.81, 1./R_3,'-*k');
legend('Sensor 0', 'Sensor 1','Sensor 3');
%title('Resistor variance not accounted for');
xlabel('Force (N)');
ylabel('Conductance (1/R)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R_28 = 0.973e6;
% R_22 = 0.991e6;
% R2_1 = R_22;
% R2_2 = R_28;
% R2_3 = R_22;
% R2_4 = R_28;
% R2_5 = R_28;
% R2_6 = R_28;
% R2_7 = R_22;
% Vin = 5;
% 
% R_1 = R2_1*Vin./measuredValue_1 - R2_1;
% R_2 = R2_2*Vin./measuredValue_2 - R2_2;
% R_3 = R2_3*Vin./measuredValue_3 - R2_3;
% R_4 = R2_4*Vin./measuredValue_4 - R2_4;
% R_5 = R2_5*Vin./measuredValue_5 - R2_5;
% R_6 = R2_6*Vin./measuredValue_6 - R2_6;
% R_7 = R2_7*Vin./measuredValue_7 - R2_7;
% 
% figure(1)
% subplot(212)
% plot(weight, 1./R_1,'-*r')
% hold on
% plot(weight, 1./R_2,'-*g')
% hold on
% plot(weight, 1./R_3,'-*k');
% hold on
% plot(weight, 1./R_4,'-*')
% hold on
% plot(weight, 1./R_5,'-xr')
% hold on
% plot(weight, 1./R_6,'-xg')
% hold on
% plot(weight, 1./R_7,'-xk')
% %legend('Sensor 1', 'Sensor 2','Sensor 3','Sensor 4','Sensor 4 : 2', 'Sensor 5', 'Sensor 6');
% title('Resistor variance accounted for');


p_1 = polyfit(weight_1,1./R_1,1);
p_2 = polyfit(weight_2,1./R_2,1);
p_3 = polyfit(weight_3,1./R_3,1);
% p_4 = polyfit(weight,1./R_4,1);
% p_5 = polyfit(weight,1./R_5,1);
% p_6 = polyfit(weight,1./R_6,1);
% p_7 = polyfit(weight,1./R_7,1);
x = 0:1:50;
y_1 = x*p_1(1) + p_1(2);
y_2 = x*p_2(1) + p_2(2);
y_3 = x*p_3(1) + p_3(2);
% y_4 = x*p_4(1) + p_4(2);
% y_5 = x*p_5(1) + p_5(2);
% y_6 = x*p_6(1) + p_6(2);
% y_7 = x*p_7(1) + p_7(2);
% 
p_avg = mean([p_1; p_2; p_3]);  
y_avg = p_avg(1)*x + p_avg(2);
% 
figure(3)
plot(weight_1,1./R_1,'r*');
hold on
plot(x,y_1,'r');
hold on
plot(weight_2,1./R_2,'g*');
hold on
plot(x,y_2,'g');
plot(weight_3,1./R_3,'k*');
hold on
plot(x,y_3,'k');
hold on
plot(x,y_avg);
% 
% legend('Sensor 1', 'Sensor 2','Sensor 3','Sensor 4','Sensor 4 : 2', 'Sensor 5', 'Sensor 6', 'Sensor 3,5 and 7 avg');
% 
figure(4)
y = linspace(0,10e-5,6)
plot(y,((y-p_avg(2))./p_avg(1))*9.81);
hold on
plot(y,((y-p_1(2))./p_1(1))*9.81,'r');
hold on
plot(y,((y-p_2(2))./p_2(1))*9.81,'g');
hold on
plot(y,((y-p_3(2))./p_3(1))*9.81,'k');
ylabel('Force (N)');
xlabel('Conductance');
% hold all
% plot(y,((y-p_4(2))./p_4(1))*0.00981);
% xlabel('Conductance')
% ylabel('Force (N)')
% legend('Sensor 3,5 and 6','Sensor 4');
% 
% 
aF = p_1(1);
bF = p_1(2);
 
save calibratedValues aF bF;
save Rs R_1 R_2 R_3