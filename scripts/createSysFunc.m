function [r, trafunc] = createSysFunc(a, dispweights)
    % Scripts for creating transfer function for a specific sensor
    % with given weights and resistance values
    r = zeros(1,length(dispweights));
    weights = dispweights.*0.45607;
    % For each weights, read voltage, calculate resistance value
    for i = 1:length(r)
        clc;
        disp('Calibration program started')
        disp('__________________________________________')
        s = strcat('Load weight of: ', num2str(dispweights(i)), 'kilograms and press a key');
        disp(s)
        % wait for user input
        pause;
        
        profile = createProfile(a);
        % Find the lowest value from the profile. The loaded sensor
        Vout = min(min(profile(1,1:8),profile(2,1:8)));
        % Calculate the resistance value for given voltage
        r(i) = calculateResistance(Vout);
    end
    % Create the equation with polyfit
    p = polyfit(weights, 1./r, 1);
    trafunc = p;
end