close all; clear all; clc;
x = 10:10:1000;
r = zeros(size(x));
%%
%MegaOhms

r(r == 0) = NaN;
r(isnan(r)) = interp1(x(~isnan(r)),r(~isnan(r)),x(isnan(r)));
%plot(x,r,'.r') 
%hold on
%plot(x,r,'b')
%xi=x(find(~isnan(r)));
%ri=r(find(~isnan(r)));
xi = 150:25:20000;
ri=interp1(x,1./r,xi,'linear');
plot(xi(:,9:end),ri(:,9:end),'b')
%hold on
%plot(xi(:,9:end),ri(:,9:end),'.b', 'LineWidth', 2)

% Fit line to data using polyfit
c2 = polyfit(xi(:,9:end),ri(:,9:end),2);
c1 = polyfit(xi(:,9:end),ri(:,9:end),1);
% Display evaluated equation y = m*x + b
disp(['Equation is y = ' num2str(c2(1)) '*x + ' num2str(c2(2))])
eq = ['y = ' num2str(c2(1)) '*x^2 + ' num2str(c2(2)) 'x + ' num2str(c2(3))];
eq2 = ['y = ' num2str(c1(1)) '*x + ' num2str(c1(2))];
% Evaluate fit equation using polyval
y2_est = polyval(c2,xi(:,9:end));
y1_est = polyval(c1,xi(:,9:end));
% Add trend line to plot
hold on
plot(xi(:,9:end),y2_est,'-.r','LineWidth',2)
hold on
plot(xi(:,9:end),y1_est,'-.g','LineWidth',2)
hold off
ylabel("Conductance")
xlabel("Grams")
legend('Measured conductance',['Linefit equation 2 coeff: ', eq],['Linefit equation 1 coeff: ', eq2])

%%
% Finding values beyond 950grams
x_beyond = 150:25:40000;
y_values = c2(1)*xi.^2 + c2(2)*xi + c2(3);
figure()
plot(xi, y_values)

