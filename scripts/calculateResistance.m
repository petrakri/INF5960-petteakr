function r = calculateResistance(Vout)
    Rfb = 180*1e3;
    Vin = 4.87;
    Vref = 3.874;
    r = Rfb * (Vin - Vref) / (Vref - Vout);
end