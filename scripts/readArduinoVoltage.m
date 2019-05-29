%%%-------------------------------------------------------------------%%%
%%% readingArduino.m                                                  %%%
%%% Version 1.0   15.10.2018                                          %%%
%%% @Petter André Kristiansen                                         %%%
%%% Function for reading voltage from arduino                         %%%
%%% Args:                                                             %%%
%%% arduinoConnection - Given connection to arduino, called from main %%%
%%% analogPin         - Specify which analog pin to read from         %%%
%%% Vout              - Current voltage out read from arduino         %%%
%%%-------------------------------------------------------------------%%%

function Vout = readArduinoVoltage(arduinoConnection, analogPin)
    Vout = readVoltage(arduinoConnection, analogPin);
end