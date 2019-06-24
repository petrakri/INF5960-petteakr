figure(1);


%for i = 1:2
%    for j = 3:4
    sys = sysfunc_all{i,j}(1)*weights2 + sysfunc_all{i,j}(2);
    r_t = r_all{i,j};
    plot(weights2, sys); hold on; plot(weights2, 1./r_t, 'o');
%    end
%end

%%
i = 2; j = 11;
%%
N = 6;
Vout = zeros(1,N);
for k = 1:N
    profile = createProfile(arduino);
    Vout(k) = profile(i, j);
end
r = calculateResistance(mean(Vout), Vref(i, j));


disp('DONE')

%%
r_all{i,j}(2) = r;
sysfunc_all{i,j} = polyfit(weights2, 1./r_all{i,j}, 1);