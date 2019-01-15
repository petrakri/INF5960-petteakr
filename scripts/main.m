%%%-------------------------------------------------------------------%%%
%%% main.m                                                            %%%
%%% Version 1.0   15.10.2018                                          %%%
%%% @Petter André Kristiansen                                         %%%
%%% Main function for operating the measurement process               %%%
%%% Args:                                                             %%%
%%% arduinoLink       - Initiates the connection to Arduino UNO       %%%
%%% readingPin        - Which pin to read from the arduino "Volts"    %%%
%%%                                                                   %%%
%%% When arduinoLink is ran, matlab initiates the link with arduino   %%%
%%%-------------------------------------------------------------------%%%


arduinoLink = arduino('com3', 'uno');
readingPin = 'A0';