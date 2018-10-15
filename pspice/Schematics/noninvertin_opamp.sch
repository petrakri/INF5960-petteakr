*version 9.1 1431857580
u 201
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
pageloc 1 0 3500 
@status
n 0 118:09:12:15:06:51;1539349611 e 
s 2832 118:09:12:15:06:52;1539349612 e 
c 118:09:12:15:06:49;1539349609
*page 1 0 970 720 iA
@ports
port 31 AGND 300 380 h
port 32 AGND 470 550 h
@parts
part 26 VDC 260 240 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 3 r 360 330 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=0.5M
part 2 r 360 220 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=4.5M
part 4 r 510 370 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=Rfeedback
a 0 xp 9 0 15 0 hln 100 REFDES=Rfeedback
a 0 u 13 0 15 25 hln 100 VALUE=1M
part 5 OPAMP 470 260 h
a 0 sp 11 0 50 60 hln 100 PART=OPAMP
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=
a 0 u 0:13 0 20 82 hlb 100 VPOS=+3.3V
a 0 u 0:13 0 20 91 hlb 100 VNEG=-3.3V
a 0 x 0:13 0 0 0 hln 100 PKGREF=MCP6004
a 0 xp 9 0 14 35 hln 100 REFDES=MCP6004
part 69 r 470 520 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=Rflexiforce
a 0 xp 9 0 15 0 hln 100 REFDES=Rflexiforce
a 0 u 13 0 15 45 hln 100 VALUE=0.15M
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 80 nodeMarker 670 280 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 77
a 0 up 0:33 0 0 0 hln 100 V=
s 470 520 470 550 168
a 0 up 33 0 457 530 hlt 100 V=
w 17
a 0 up 0:33 0 0 0 hln 100 V=
s 360 180 360 170 16
s 360 170 260 170 18
a 0 up 33 0 310 174 hct 100 V=
s 260 170 260 240 27
w 116
a 0 up 0:33 0 0 0 hln 100 V=
s 300 380 300 360 108
s 300 360 360 360 110
s 260 360 300 360 103
s 360 330 360 360 14
s 260 280 260 360 29
a 0 up 33 0 267 335 hlt 100 V=
w 129
a 0 up 0:33 0 0 0 hln 100 V=
s 470 480 470 370 164
a 0 up 33 0 437 410 hlt 100 V=
s 510 370 470 370 38
s 470 300 470 370 35
w 154
a 0 sr 0:3 0 725 288 hcn 100 LABEL=Vout
a 0 up 0:33 0 0 0 hln 100 V=
s 550 280 600 280 155
a 0 sr 3 0 725 288 hcn 100 LABEL=Vout
a 0 up 33 0 610 264 hct 100 V=
s 670 280 680 280 156
s 550 370 600 370 41
s 600 280 670 280 193
s 600 370 600 280 68
w 7
a 0 up 0:33 0 0 0 hln 100 V=
s 360 290 360 260 10
s 360 260 360 220 124
s 360 260 470 260 8
a 0 up 33 0 420 269 hct 100 V=
@junction
j 300 380
+ s 31
+ w 116
j 300 360
+ w 116
+ w 116
j 360 330
+ p 3 1
+ w 116
j 470 550
+ s 32
+ w 77
j 260 240
+ p 26 +
+ w 17
j 260 280
+ p 26 -
+ w 116
j 470 370
+ w 129
+ w 129
j 670 280
+ p 80 pin1
+ w 154
j 600 280
+ w 154
+ w 154
j 360 290
+ p 3 2
+ w 7
j 360 260
+ w 7
+ w 7
j 360 180
+ p 2 2
+ w 17
j 360 220
+ p 2 1
+ w 7
j 510 370
+ p 4 1
+ w 129
j 550 370
+ p 4 2
+ w 154
j 470 300
+ p 5 -
+ w 129
j 550 280
+ p 5 OUT
+ w 154
j 470 260
+ p 5 +
+ w 7
j 470 480
+ p 69 2
+ w 129
j 470 520
+ p 69 1
+ w 77
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 82 t 5 510 226 580 240 0 16
Vsupply = 3.3V

t 173 t 5 370 235 428 251 0 15
Voltage divider
