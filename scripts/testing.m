for i = 1:16
j = i-1;
bitand(j,1)
bitshift(bitand(j,3),-1)
bitshift(bitand(j,7),-2)
bitshift(bitand(j,15),-3)
end