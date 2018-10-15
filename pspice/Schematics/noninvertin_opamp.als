* Schematics Aliases *

.ALIASES
V_V1            V1(+=$N_0001 -=0 )
R_R2            R2(1=0 2=$N_0002 )
R_R1            R1(1=$N_0002 2=$N_0001 )
R_Rfeedback          Rfeedback(1=$N_0003 2=Vout )
E_MCP6004          MCP6004(OUT=Vout +=$N_0002 -=$N_0003 )
R_Rflexiforce          Rflexiforce(1=0 2=$N_0003 )
_    _(Vout=Vout)
.ENDALIASES

