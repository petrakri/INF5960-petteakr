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
        % Choose last value after 10 samples, for the ADC to stabilize
        for j = 1:10
            temp(1,j) = a.readVoltage('A0');
            temp(2,j) = a.readVoltage('A1');
            temp(3,j) = a.readVoltage('A2');
        end
        % Subtract 2% voltage error from the adc
        mux0array(i) = temp(1,end) - 0.02 * temp(1,end);
        mux1array(i) = temp(2,end) - 0.02 * temp(2,end);
        mux2array(i) = temp(3,end) - 0.02 * temp(3,end);
    end
end