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

        mux0array(i) = a.readVoltage('A0');
        mux1array(i) = a.readVoltage('A1');
        mux2array(i) = a.readVoltage('A2');
    end
end