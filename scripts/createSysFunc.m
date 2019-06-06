function [r, trafunc] = createSysFunc(a, weights)
    % Scripts for creating transfer function for a specific sensor
    % with given weights and resistance values
    r = zeros(1,length(weights));
    Vout = zeros(1,4);
    % For each weights, read voltage, calculate resistance value
    for i = 1:length(r)
        clc;
        disp('Calibration program started')
        disp('__________________________________________')
        s = strcat('Load weight of: ', num2str(weights(i)), 'grams and press a key');
        disp(s)
        % wait for user input
        pause;
        for j = 1:length(Vout)
            profile = createProfile(a);
            % Find the lowest value from the profile. The loaded sensor
            %Vout = min(min(profile(1,1:8),profile(2,1:8)));
            Vout(j) = profile(1,2);
        end
        % Calculate the resistance value for given voltage
        r(i) = calculateResistance(mean(Vout));
    end
    % Create the equation with polyfit
    p = polyfit(weights, 1./r, 1);
    trafunc = p;
end