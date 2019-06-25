% Sensor location check
while 1
    profile = createProfile(arduino);
    [val_ch, ch] = min(profile);
    [val_s, s] = min(val_ch);
    a = ['Channel', ' ', num2str(ch(s)), ', sensor', ' ', num2str(s)];

    disp(a)
end