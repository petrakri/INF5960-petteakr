function trafunc = createSysFunc(weights)
    % Scripts for creating transfer function for a specific sensor
    % with given weights and resistance values
    r = zeros(1,length(weights));
    for i = 1:length(weights)
        clc;
        disp('Calibration program started')
        disp('__________________________________________')
        s = strcat('Load weight of: ', num2str(weights(i)), 'kilograms and press a key');
        disp(s)
        % wait for user input
        pause;
        % For each weights, read voltage, calculate resistance value
        profile = createProfile(a);
        Vout = min(min(profile(1,1:8),profile(2,1:8)));
        r(i) = calculateResistance(Vout);
    end
end