function profile = createProfile(a)
    [io1, io2, io3] = MUXanalogread(a);
    io1_L = io1(1:2:end);
    io1_R = io1(2:2:end);
    io2_L = io2(1:2:end);
    io2_R = io2(2:2:end);
    io3_L = io3(1:2:end);
    io3_R = io3(2:2:end);
    profile = [io1_L, io2_L, io3_L; io1_R, io2_R, io3_R];
end