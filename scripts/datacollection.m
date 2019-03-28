function [mu, measuredValues] = datacollection(weights, samples, arduinoLink, readingPin)
measuredValues = zeros(length(weights), samples);
mu = zeros(size(weights));

for i=1:length(weights)
    disp(['Load ', num2str(weights(1,i)), ' kg and press a key!'])
    pause;
    for j=1:length(measuredValues)
        Vout = readArduinoVoltage(arduinoLink, readingPin);
        pause(0.1)
        measuredValues(i,j) = Vout;
        mu(1,i) = mean(measuredValues(i,:));
    end
    disp([num2str(weights(1,i)), 'kg: mu = ', num2str(mu(1,i))])
    disp('____________________________________')
end
disp('Data collection complete')
save collectedData measuredValues mu weights;
end