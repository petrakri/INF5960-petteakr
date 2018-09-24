* Schematics Aliases *

.ALIASES
R_R2            R2(1=0 2=$N_0001 )
R_R1            R1(1=$N_0001 2=$N_0002 )
R_Rf            Rf(1=$N_0003 2=Vout )
C_C1            C1(1=$N_0003 2=Vout )
E_U1            U1(OUT=Vout +=$N_0001 -=$N_0003 )
R_R4            R4(1=0 2=$N_0003 )
V_V1            V1(+=$N_0002 -=0 )
_    _(Vout=Vout)
.ENDALIASES

