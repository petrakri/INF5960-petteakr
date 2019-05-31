*version 9.1 1068489866
u 68
R? 2
V? 2
? 2
@libraries
@analysis
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1887 
@status
n 0 118:08:24:18:54:14;1537808054 e 
s 0 118:08:24:18:54:14;1537808054 e 
c 119:00:31:14:27:59;1548941279
*page 1 0 970 720 iA
@ports
port 27 AGND 350 350 h
a 1 x 3 0 19 15 hln 100 LABEL=GND
@parts
part 2 r 440 230 d
a 0 x 0:13 0 0 0 hln 100 PKGREF=R_flexiforce
a 0 xp 9 0 25 0 hln 100 REFDES=R_flexiforce
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 25 35 hln 100 VALUE=1M
part 10 r 440 350 v
a 0 x 0:13 0 0 0 hln 100 PKGREF=R_1
a 0 xp 9 0 15 35 hln 100 REFDES=R_1
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 0 hln 100 VALUE=1M
part 21 VDC 350 270 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 1 u 13 0 -11 18 hcn 100 DC=3.3V
a 0 x 0:13 0 0 0 hln 100 PKGREF=V_supply
a 1 xp 9 0 39 22 hcn 100 REFDES=V_supply
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 28 nodeMarker 500 290 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 4
a 0 sr 0 0 0 0 hln 100 LABEL=V_out
a 0 up 0:33 0 0 0 hln 100 V=
s 440 290 500 290 5
a 0 sr 3 0 470 288 hcn 100 LABEL=V_out
a 0 up 33 0 530 284 hct 100 V=
s 440 290 440 310 32
s 440 270 440 290 3
w 16
a 0 up 0:33 0 0 0 hln 100 V=
s 350 230 350 270 19
a 0 up 33 0 352 250 hlt 100 V=
s 440 230 350 230 17
w 37
a 0 up 0:33 0 0 0 hln 100 V=
s 350 310 350 350 60
a 0 up 33 0 352 340 hlt 100 V=
s 440 350 350 350 39
a 0 up 33 0 442 340 hlt 100 V=
@junction
j 440 310
+ p 10 2
+ w 4
j 440 270
+ p 2 2
+ w 4
j 440 290
+ w 4
+ w 4
j 500 290
+ p 28 pin1
+ w 4
j 350 270
+ p 21 +
+ w 16
j 440 230
+ p 2 1
+ w 16
j 350 310
+ p 21 -
+ w 37
j 440 350
+ p 10 1
+ w 37
j 350 350
+ s 27
+ w 37
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
