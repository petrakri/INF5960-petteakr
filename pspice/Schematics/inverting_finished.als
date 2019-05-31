* Schematics Aliases *

.ALIASES
C_C2            C2(1=0 2=Vout )
C_C1            C1(1=$N_0001 2=$N_0002 )
R_R6            R6(1=$N_0002 2=Vout )
C_C3            C3(1=0 2=$N_0003 )
C_C4            C4(1=0 2=$N_0003 )
R_Rf            Rf(1=$N_0001 2=$N_0002 )
R_R1            R1(1=Vbias 2=$N_0003 )
X_U4A           U4A(+=Vbias -=$N_0001 V+=$N_0003 V-=0 OUT=$N_0002 )
R_R3            R3(1=$N_0004 2=$N_0003 )
R_R2            R2(1=0 2=$N_0004 )
V_VDC           VDC(+=$N_0003 -=0 )
D_D1            D1(1=0 2=Vbias )
R_R9            R9(1=$N_0004 2=$N_0001 )
_    _(Vout=Vout)
_    _(Vbias=Vbias)
.ENDALIASES

