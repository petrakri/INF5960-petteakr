* Schematics Aliases *

.ALIASES
C_C1            C1(1=$N_0001 2=V_out )
E_U1            U1(OUT=V_out +=GND -=$N_0001 )
R_R_feedback          R_feedback(1=$N_0001 2=V_out )
R_R5            R5(1=0 2=$N_0002 )
R_R_flexiforce          R_flexiforce(1=$N_0001 2=$N_0002 )
R_R4            R4(1=$N_0002 2=$N_0003 )
V_V3            V3(+=$N_0003 -=GND )
_    _(V_out=V_out)
_    _(GND=GND)
.ENDALIASES

