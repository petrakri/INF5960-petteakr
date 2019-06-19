function r = calculateResistance(Vout, Vref)
    Rfb = 180*1e3;
    Vin = 4.839;
    %Vref = 3.874;
    r = Rfb * (Vin - Vref) / (Vref - Vout);
end