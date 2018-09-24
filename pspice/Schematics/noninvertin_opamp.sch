*version 9.1 943200218
u 82
R? 5
U? 3
V? 2
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
pageloc 1 0 3461 
@status
n 0 118:08:21:16:20:25;1537539625 e 
s 0 118:08:21:16:20:25;1537539625 e 
*page 1 0 970 720 iA
@ports
port 31 AGND 100 210 h
port 32 AGND 260 350 h
@parts
part 3 r 160 180 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
part 2 r 160 100 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
part 4 r 300 210 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 25 hln 100 VALUE=100k
a 0 x 0:13 0 0 0 hln 100 PKGREF=Rf
a 0 xp 9 0 15 0 hln 100 REFDES=Rf
part 37 c 300 260 h
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 15 25 hln 100 VALUE=47p
part 5 OPAMP 270 120 h
a 0 sp 11 0 50 60 hln 100 PART=OPAMP
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 14 0 hln 100 REFDES=U1
a 0 u 0:13 0 20 82 hlb 100 VPOS=+3.3V
a 0 u 0:13 0 20 91 hlb 100 VNEG=-3.3V
part 69 r 260 320 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R4
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 u 13 0 15 45 hln 100 VALUE=0.5M
part 26 VDC 100 100 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 80 nodeMarker 410 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 7
a 0 up 0:33 0 0 0 hln 100 V=
s 160 100 160 120 6
s 160 120 270 120 8
a 0 up 33 0 215 119 hct 100 V=
s 160 140 160 120 10
w 17
a 0 up 0:33 0 0 0 hln 100 V=
s 160 60 160 50 16
s 160 50 100 50 18
a 0 up 33 0 130 49 hct 100 V=
s 100 50 100 100 27
w 15
a 0 up 0:33 0 0 0 hln 100 V=
s 160 180 160 210 14
s 160 210 100 210 22
s 100 140 100 210 29
a 0 up 33 0 102 175 hlt 100 V=
w 34
a 0 up 0:33 0 0 0 hln 100 V=
s 270 160 260 160 33
s 260 160 260 210 35
s 300 210 260 210 38
s 300 260 260 260 49
s 260 210 260 260 40
a 0 up 33 0 262 235 hlt 100 V=
s 260 260 260 280 70
w 77
a 0 up 0:33 0 0 0 hln 100 V=
s 260 320 260 350 76
a 0 up 33 0 262 335 hlt 100 V=
w 42
a 0 sr 0 0 0 0 hln 100 LABEL=Vout
a 0 up 0:33 0 0 0 hln 100 V=
s 390 140 410 140 78
a 0 sr 3 0 400 138 hcn 100 LABEL=Vout
a 0 up 33 0 400 139 hct 100 V=
s 390 140 350 140 47
s 390 260 390 210 54
s 330 260 390 260 52
s 390 210 390 140 68
s 340 210 390 210 41
@junction
j 160 100
+ p 2 1
+ w 7
j 160 140
+ p 3 2
+ w 7
j 160 120
+ w 7
+ w 7
j 160 180
+ p 3 1
+ w 15
j 160 60
+ p 2 2
+ w 17
j 100 100
+ p 26 +
+ w 17
j 100 140
+ p 26 -
+ w 15
j 100 210
+ s 31
+ w 15
j 300 210
+ p 4 1
+ w 34
j 260 210
+ w 34
+ w 34
j 300 260
+ p 37 1
+ w 34
j 330 260
+ p 37 2
+ w 42
j 340 210
+ p 4 2
+ w 42
j 390 210
+ w 42
+ w 42
j 260 260
+ w 34
+ w 34
j 260 280
+ p 69 2
+ w 34
j 260 320
+ p 69 1
+ w 77
j 260 350
+ s 32
+ w 77
j 390 140
+ w 42
+ w 42
j 410 140
+ p 80 pin1
+ w 42
j 270 120
+ p 5 +
+ w 7
j 270 160
+ p 5 -
+ w 34
j 350 140
+ p 5 OUT
+ w 42
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
