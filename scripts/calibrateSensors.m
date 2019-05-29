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

function measuredValues = calibrateSensors(arduinoConnection, pin)
    weights = [10, 20, 50, 100, 200, 500, 700];
    measuredValues = zeros(size(weights));
    samples = 10;
    voltages = zeros(1,10);
    numOfSensors = 2;
    for k = 1:numOfSensors
        clc;
        disp('Calibration program started')
        disp('__________________________________________')
        sensor = strcat('Sensor: ',num2str(k));
        disp(sensor);
        for n = 1:length(weights)
            s = strcat('Load next weight of: ', num2str(weights(n)), ' grams');
            disp(s)
            % wait for user input
            pause;
            % read the voltage from arduino
            for i=1:samples
                voltages(i) = readArduinoVoltage(arduinoConnection, pin);
                measuredValues(n) = mean(voltages);
            end
        end
        s2 = strcat('Calibrationvalues collected for sensor: ', num2str(k));
        disp(s2)
        disp('__________________________________________')
    end

    %save measured data in a .mat file to be used for measurement
    save weights measuredValues;
    disp('Calibration of sensors finished !')
end