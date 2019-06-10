function [mux0array, mux1array, mux2array] = MUXanalogread(a) 
    % MUX configuration, ref: Mayhew Labs User Guide
    % Selection pins used for selection 
    S0 = 'D2';
    S1 = 'D4';
    S2 = 'D6';
    S3 = 'D7';
    % Arrays for storing voltage values
    mux0array = zeros(1,16);
    mux1array = zeros(1,16);
    mux2array = zeros(1,16); 
    
    for i = 1:length(mux0array)
        j = i-1;
        a.writeDigitalPin(S0, bitand(j,1));
        a.writeDigitalPin(S1, bitshift(bitand(j,3),-1));
        a.writeDigitalPin(S2, bitshift(bitand(j,7),-2));
        a.writeDigitalPin(S3, bitshift(bitand(j,15),-3));
        % Choose 3 values for mean after 3 samples, for the ADC to stabilize
        for j = 1:6
            temp(1,j) = a.readVoltage('A0');
            temp(2,j) = a.readVoltage('A1');
            temp(3,j) = a.readVoltage('A2');
        end
        % Subtract 2% voltage error from the adc
        mux0array(i) = mean(temp(1,3:end)) - 0.02 * mean(temp(1,5:end));
        mux1array(i) = mean(temp(2,3:end)) - 0.02 * mean(temp(2,5:end));
        mux2array(i) = mean(temp(3,3:end)) - 0.02 * mean(temp(3,5:end));
    end
end