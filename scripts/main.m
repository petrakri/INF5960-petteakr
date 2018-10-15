%%%-------------------------------------------------------------------%%%
%%% main.m                                                            %%%
%%% Version 1.0   15.10.2018                                          %%%
%%% @Petter Andr� Kristiansen                                         %%%
%%% Main function for operating the measurement process               %%%
%%% Args:                                                             %%%
%%% arduinoLink       - Initiates the connection to Arduino UNO       %%%
%%% readingPin        - Which pin to read from the arduino "Volts"    %%%
%%%-------------------------------------------------------------------%%%


arduinoLink = arduino('com3', 'uno');
readingPin = 'A0';