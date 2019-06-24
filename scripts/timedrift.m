%% Time drift test

t = linspace(1,60,60);
r_time = zeros(1,length(t));
for time = 1:length(t)/10
   profile_time = createProfile(arduino);
   r_time(time) = calculateResistance(profile_time(1,1), Vref(1, 1));
end