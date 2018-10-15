*version 9.1 83907543
u 131
R? 3
V? 3
C? 2
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
pageloc 1 0 2853 
@status
n 0 118:08:26:19:23:03;1537982583 e 
s 2832 118:08:26:19:23:03;1537982583 e 
c 118:08:26:19:23:02;1537982582
*page 1 0 970 720 iA
@ports
port 11 AGND 420 240 h
port 109 AGND 270 340 h
@parts
part 8 c 490 430 h
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 15 25 hln 100 VALUE=47p
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
part 10 OPAMP 460 240 h
a 0 sp 11 0 50 60 hln 100 PART=OPAMP
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=
a 0 u 0:13 0 20 82 hlb 100 VPOS=+3.3V
a 0 u 0:13 0 20 91 hlb 100 VNEG=-3.3V
a 0 x 0:13 0 0 0 hln 100 PKGREF=MCP6004
a 0 xp 9 0 14 35 hln 100 REFDES=MCP6004
part 108 VDC 270 300 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=Vref
a 1 xp 9 0 29 22 hcn 100 REFDES=Vref
a 1 u 13 0 -11 23 hcn 100 DC=0.5V
part 9 r 480 350 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=Rfeedback
a 0 xp 9 0 15 0 hln 100 REFDES=Rfeedback
a 0 u 13 0 15 25 hln 100 VALUE=1M
part 6 r 360 280 u
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=Rflexiforce
a 0 xp 9 0 35 0 hln 100 REFDES=Rflexiforce
a 0 u 13 0 30 30 hln 100 VALUE=0.2M
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 107 nodeMarker 630 260 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 30
a 0 up 0:33 0 0 0 hln 100 V=
s 360 280 420 280 85
s 480 350 420 350 33
s 420 350 420 430 96
a 0 up 33 0 427 415 hlt 100 V=
s 490 430 420 430 29
s 420 280 460 280 124
s 420 280 420 350 37
a 0 up 33 0 377 325 hlt 100 V=
w 15
a 0 sr 0:3 0 655 178 hcn 100 LABEL=Vout
a 0 up 0:33 0 0 0 hln 100 V=
s 540 260 590 260 24
a 0 up 33 0 600 244 hct 100 V=
a 0 sr 3 0 620 273 hcn 100 LABEL=Vout
s 590 260 630 260 28
s 520 350 590 350 22
s 590 350 590 260 94
s 520 430 590 430 18
s 590 430 590 350 20
w 98
a 0 up 0:33 0 0 0 hln 100 V=
s 420 240 460 240 99
a 0 up 33 0 440 239 hct 100 V=
w 105
a 0 up 0:33 0 0 0 hln 100 V=
s 270 300 270 280 112
s 270 280 320 280 113
a 0 up 33 0 270 269 hct 100 V=
@junction
j 270 340
+ p 108 -
+ s 109
j 360 280
+ p 6 1
+ w 30
j 460 280
+ p 10 -
+ w 30
j 490 430
+ p 8 1
+ w 30
j 420 280
+ w 30
+ w 30
j 420 350
+ w 30
+ w 30
j 270 300
+ p 108 +
+ w 105
j 320 280
+ p 6 2
+ w 105
j 630 260
+ p 107 pin1
+ w 15
j 520 430
+ p 8 2
+ w 15
j 590 350
+ w 15
+ w 15
j 540 260
+ p 10 OUT
+ w 15
j 590 260
+ w 15
+ w 15
j 460 240
+ p 10 +
+ w 98
j 420 240
+ s 11
+ w 98
j 480 350
+ p 9 1
+ w 30
j 520 350
+ p 9 2
+ w 15
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 2 t 5 480 216 550 230 0 16
Vsupply = 3.3V

