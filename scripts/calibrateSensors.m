%%%-------------------------------------------------------------------%%%
%%% calibrateSensors.m                                                %%%
%%% Version 1.0   15.10.2018                                          %%%
%%% @Petter André Kristiansen                                         %%%
%%% Function for calibration of the sensors                           %%%
%%% Args:                                                             %%%
%%% arduinoConnection - Given connection to arduino, called from main %%%
%%% pin               - Specify which analog pin to read from         %%%
%%% weights           - Weights used for calibration of the sensors   %%%
%%% measuredValue     - Current read voltage for given weight         %%%
%%%-------------------------------------------------------------------%%%

function calibrateSensors(arduinoConnection, pin)
    weights = [5, 10, 20, 30, 35, 40, 45];
    measuredValue = zeros(size(weights));
    for n = 1:length(weights)
        s = strcat('Load next weight of : ', num2str(weights(n)), ' kilograms');
        disp(s)
        pause;
        %measuredValue(n) = readArduinoVoltage(arduinoConnection, pin);
        %TODO: add eventhandler to wait for userinput, continue with next
        %weight
        
        %pause(press a button)
        %Give message to user to load new weight and press button
        
        disp('Calibrationvalue collected !')
    end
    
    %TODO: Do measuredValue steps for seweral sensors
    %and save measured data in a .mat file to be used for measurement
    save calibration_values weights measured_value;
    disp('Calibration of sensors finished !')
end