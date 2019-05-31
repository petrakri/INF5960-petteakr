*version 9.1 1970660248
u 229
R? 5
U? 3
V? 2
C? 2
? 3
@libraries
@analysis
.TRAN 0 0 0 0
+0 1ns
+1 1000ns
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
pageloc 1 0 2584 
@status
n 0 118:09:12:15:06:51;1539349611 e 
s 0 119:00:31:23:35:40;1548974140 e 
c 119:01:01:00:10:00;1548976200
*page 1 0 970 720 iA
@ports
port 31 AGND 400 310 h
a 1 x 3 0 14 20 hln 100 LABEL=GND
port 32 AGND 470 390 h
a 1 x 3 0 14 20 hln 100 LABEL=GND
@parts
part 26 VDC 400 270 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=V_in
a 1 u 13 0 29 23 hcn 100 DC=0.5V
a 1 xp 9 0 -11 22 hcn 100 REFDES=V_in
part 5 OPAMP 470 260 h
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=
a 0 u 0:13 0 20 82 hlb 100 VPOS=+3.3V
a 0 u 0:13 0 20 91 hlb 100 VNEG=-3.3V
a 0 x 0:13 0 0 0 hln 100 PKGREF=
a 0 xp 9 0 14 35 hln 100 REFDES=
a 0 sp 11 0 30 60 hln 100 PART=OPAMP
part 4 r 510 340 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 0 hln 100 VALUE=1M
a 0 x 0:13 0 0 0 hln 100 PKGREF=R_feedback
a 0 xp 9 0 0 25 hln 100 REFDES=R_feedback
part 69 r 470 400 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=R_flexiforce
a 0 xp 9 0 15 0 hln 100 REFDES=R_flexiforce
a 0 u 13 0 15 30 hln 100 VALUE=1M
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 80 nodeMarker 620 280 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 7
a 0 up 0:33 0 0 0 hln 100 V=
s 400 260 470 260 8
a 0 up 33 0 440 269 hct 100 V=
s 400 270 400 260 10
w 129
a 0 up 0:33 0 0 0 hln 100 V=
s 510 340 470 340 38
s 470 300 470 340 35
s 470 360 470 340 164
a 0 up 33 0 437 335 hlt 100 V=
w 77
a 0 up 0:33 0 0 0 hln 100 V=
s 470 390 470 400 224
a 0 up 33 0 457 375 hlt 100 V=
w 154
a 0 up 0:33 0 0 0 hln 100 V=
a 0 sr 0:3 0 725 288 hcn 100 LABEL=V_out
s 550 280 600 280 155
a 0 up 33 0 610 264 hct 100 V=
a 0 sr 3 0 620 293 hcn 100 LABEL=V_out
s 550 340 600 340 41
s 600 280 620 280 206
s 600 340 600 280 68
@junction
j 510 340
+ p 4 1
+ w 129
j 470 300
+ p 5 -
+ w 129
j 470 260
+ p 5 +
+ w 7
j 470 360
+ p 69 2
+ w 129
j 470 340
+ w 129
+ w 129
j 470 400
+ p 69 1
+ w 77
j 470 390
+ s 32
+ w 77
j 550 280
+ p 5 OUT
+ w 154
j 550 340
+ p 4 2
+ w 154
j 600 280
+ w 154
+ w 154
j 620 280
+ p 80 pin1
+ w 154
j 400 270
+ p 26 +
+ w 7
j 400 310
+ s 31
+ p 26 -
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 82 t 5 500 246 570 270 0 16
Vsupply = 3.3V

