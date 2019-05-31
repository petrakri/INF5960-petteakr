function a = ArduinoSetup(com, type)
    % Establish arduino connection
    a = arduino(com, type,'Libraries','Adafruit\MotorShieldV2');
    shield = addon(a,'Adafruit\MotorShieldV2');
    
    % Selection pins used for selection 
    S0 = 'D2';
    S1 = 'D4';
    S2 = 'D6';
    S3 = 'D7';
    
    % Set pinmodes for I/O's to OUTPUT mode, used for MUX Shield II
    a.configurePin(S0,'DigitalOutput');
    a.configurePin(S1,'DigitalOutput');
    a.configurePin(S2,'DigitalOutput');
    a.configurePin(S3,'DigitalOutput');
end