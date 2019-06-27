%% Calibration of all 48 sensors (For best accuracy)
% Channel 1 is left side, channel 2 is right side
% i = channel y-axis, j = sensor x-axis 
for i = 1:2
    % Calibration for channel number i
    for j = 1:24
        % Calibrate sensor number j
        clc;
        a = 'Calibration of';
        b = [' ','Channel', ' ', num2str(i), ' '];
        c = ['Sensor', ' #', num2str(j), ' '];
        s = [a,b,c];
        disp(s)
        disp('___________________________________')
        [r, sysfunc] = createSysFunc(arduino, weights2, Vref_actual, i, j);
        sysfunc_all{i,j} = sysfunc;
        r_all{i,j} = r;
    end
end