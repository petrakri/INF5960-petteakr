clear all 
close all

load Rs

figure(1)
plot(R_1(2:end))
hold on
plot(R_2,'r')
hold on
plot(R_3,'g')


Vin = 5;
R2_1 = 1e6;
R2_2 = 100e3;
R2_3 = 47e3;
R2_4 = 22e3;
R1_1 = R_2;
V_out_1 = (Vin.*R2_1)./(R1_1+R2_1);
V_out_2 = (Vin.*R2_2)./(R1_1+R2_2);
V_out_3 = (Vin.*R2_3)./(R1_1+R2_3);
V_out_4 = (Vin.*R2_4)./(R1_1+R2_4);

figure(2)
plot(V_out_1)
hold on
plot(V_out_2,'r')
hold on
plot(V_out_3,'g')
hold on
plot(V_out_4,'k')
legend('1M','100K','47K','22K')
title('Voltage divider.');


diff_1M = max(V_out_1) - min(V_out_1)
diff_100k = max(V_out_2) - min(V_out_2)
diff_47k = max(V_out_3) - min(V_out_3)
diff_22k = max(V_out_4) - min(V_out_4)

Vout_5 = 0.4545 .*( 200e3./R1_1);


figure(3)
clear all 
close all

load Rs

figure(1)
plot(R_1(2:end))
hold on
plot(R_2,'r')
hold on
plot(R_3,'g')


Vin = 5;
R2_1 = 1e6;
R2_2 = 100e3;
R2_3 = 47e3;
R2_4 = 22e3;
R1_1 = R_2;
V_out_1 = (Vin.*R2_1)./(R1_1+R2_1);
V_out_2 = (Vin.*R2_2)./(R1_1+R2_2);
V_out_3 = (Vin.*R2_3)./(R1_1+R2_3);
V_out_4 = (Vin.*R2_4)./(R1_1+R2_4);

figure(2)
plot(V_out_1)
hold on
plot(V_out_2,'r')
hold on
plot(V_out_3,'g')
hold on
plot(V_out_4,'k')
legend('1M','100K','47K','22K')
title('Voltage divider.');


diff_1M = max(V_out_1) - min(V_out_1)
diff_100k = max(V_out_2) - min(V_out_2)
diff_47k = max(V_out_3) - min(V_out_3)
diff_22k = max(V_out_4) - min(V_out_4)

Vout_5 = 0.4545 .*( 200e3./R1_1);


figure(3)
plot(Vout_5)
diff_5 = max(Vout_5) - min(Vout_5)

R1 = R_2(3)
R2 = linspace(1,1e6,1000);
derivatedVout2 = Vin.*R2./(R2+R1).^2;
figure(4)
plot(R2,derivatedVout2);
[C,I] = max(derivatedVout2);
R2(I)




%%%%%%%%%%% 
figure(5)
Vout_6 = 0.4545.*(200e3./R1_1);
plot(Vout_6)
plot(Vout_5)
diff_5 = max(Vout_5) - min(Vout_5)

R1 = R_2(3)
R2 = linspace(1,1e6,1000);
derivatedVout2 = Vin.*R2./(R2+R1).^2;
figure(4)
plot(R2,derivatedVout2);
[C,I] = max(derivatedVout2);
R2(I)




%%%%%%%%%%% 
figure(5)
Vout_6 = 0.4545.*(200e3./R1_1);
plot(Vout_6)