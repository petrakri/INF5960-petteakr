close all; clear all; clc;

Vref = 3.88;
Vin = 5;
Rf = 180*1e3;
Rflex = [mean([80, 90, 73]), mean([40.4, 46, 36]), mean([29.4, 32, 29])]*1e3;
weights = [5, 10, 15];

R_values = Rflex(1,3):2500:600000;

G = Rf./R_values;

Vout = Vref - G * (Vin - Vref);
points = [Rf/Rflex(1,1), Rf/Rflex(1,2),Rf/Rflex(1,3)];

Rf2 = 140*1e3;
G2 = Rf2./R_values;
Vout2 = Vref - G2 * (Vin - Vref);
points2 = [Rf2/Rflex(1,1), Rf2/Rflex(1,2),Rf2/Rflex(1,3)];

% Plotting
txt5 = '5kg \rightarrow ';
txt10 = '10kg \rightarrow';
txt15 = '15kg \rightarrow';
yyaxis left;
figure(1);
plot(R_values, G);
hold on;
plot(R_values, G2);
plot(Rflex, points,'*r');
plot(Rflex, points2,'*g');

xlabel("Resistance");
ylabel("Gain");
title("Gain and Vout plot")
text(Rflex(1,1), points(1,1), txt5, 'HorizontalAlignment', 'right', 'FontSize', 11)
text(Rflex(1,2), points(1,2), txt10, 'HorizontalAlignment', 'right', 'FontSize', 11)
text(Rflex(1,3), points(1,3), txt15, 'HorizontalAlignment', 'right', 'FontSize', 11)
text(Rflex(1,1), points2(1,1), '\leftarrow 5kg', 'HorizontalAlignment', 'left', 'FontSize', 11)
text(Rflex(1,2), points2(1,2), '\leftarrow 10kg', 'HorizontalAlignment', 'left', 'FontSize', 11)
text(Rflex(1,3), points2(1,3), '\leftarrow 15kg', 'HorizontalAlignment', 'left', 'FontSize', 11)

yyaxis right;
plot(R_values, Vout);
hold on;
plot(R_values, Vout2, 'g');
ylabel("Vout")
grid on;
legend(['Rf = ' num2str(Rf) '\Omega'], ['Rf = ' num2str(Rf2) '\Omega'], ...
    'Datapoints: 15kg, 10kg, 5kg', ...
    'Datapoints: 15kg, 10kg, 5kg', ...
    'Vout: 180k \Omega', ...
    'Vout: 140k \Omega', ...
    'Location', 'northeastoutside');
hold off;


