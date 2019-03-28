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

close all; clear all; clc;

a = arduino();
a.Aref = 3.88;

%a = arduino('com3', 'uno','Libraries','Adafruit\MotorShieldV2');
shield = addon(a,'Adafruit\MotorShieldV2');
%import arduinoio.internal.MWProtocol.*
%configurePin(a, 'Aref')
%pinMode(a, 'AREF')
readingPin = 'A0';


weights = [5, 10, 15, 20, 25];
samples = 1;
%[mu, measuredValues] = datacollection(weights, samples, a, readingPin);


%calibration = calibrateSensors()