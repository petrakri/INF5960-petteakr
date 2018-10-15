clear all; clc;
Rf = linspace(0.15,1,10);
Rv = linspace(0.15,10,250);
%Rv = Rv(end:-1:1);
Vin = 0.5;
M = length(Rf);
figure(1);
labels = cell(1,M);
for r = 1:M
    Vo = Vin*( 1 + (Rf(r)./Rv) );
    plot(Rv,Vo)
    hold on;
    xlabel('Load on cell, MegaOhm')
    ylabel('Vout')
    labels{r} = sprintf('R=%d',Rf(r));
end
legend(labels);