* Schematics Aliases *

.ALIASES
C_C1            C1(1=$N_0001 2=Vout )
E_MCP6004          MCP6004(OUT=Vout +=0 -=$N_0001 )
V_Vref          Vref(+=$N_0002 -=0 )
R_Rfeedback          Rfeedback(1=$N_0001 2=Vout )
R_Rflexiforce          Rflexiforce(1=$N_0001 2=$N_0002 )
_    _(Vout=Vout)
.ENDALIASES

