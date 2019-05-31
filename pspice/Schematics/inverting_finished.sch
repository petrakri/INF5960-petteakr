*version 9.1 590120226
u 157
U? 5
D? 2
R? 10
V? 2
C? 5
? 2
@libraries
@analysis
.DC 0 0 0 0 1 1
.TRAN 1 0 0 0
+0 1ns
+1 1000ns
.TF 0 Vout VDC
.SENS 0 
.LIB C:\Users\Petter\Documents\prog\github\INF5960-petteakr\pspice\Schematics\inverting_finished.lib
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
pageloc 1 0 6321 
@status
n 0 119:02:06:08:53:32;1551858812 e 
s 2832 119:02:06:08:57:12;1551859032 e 
*page 1 0 970 720 iA
@ports
port 8 GND_EARTH 350 410 h
port 7 GND_EARTH 240 410 h
port 9 GND_EARTH 180 410 h
port 10 GND_EARTH 640 420 h
port 111 GND_EARTH 270 410 h
port 117 GND_EARTH 300 410 h
port 155 GND_EARTH 480 290 u
@parts
part 81 c 640 400 v
a 0 u 13 0 9 43 hln 100 VALUE=100n
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C2
a 0 ap 9 0 15 0 hln 100 REFDES=C2
part 48 c 460 200 h
a 0 u 13 0 15 25 hln 100 VALUE=47p
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
part 75 r 580 320 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R6
a 0 ap 9 0 15 0 hln 100 REFDES=R6
part 110 c 270 400 v
a 0 u 13 0 17 29 hln 100 VALUE=10u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C3
a 0 ap 9 0 25 28 hln 100 REFDES=C3
part 116 c 300 400 v
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C4
a 0 u 13 0 17 31 hln 100 VALUE=100n
a 0 ap 9 0 25 24 hln 100 REFDES=C4
part 47 r 460 240 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=Rf
a 0 xp 9 0 15 0 hln 100 REFDES=Rf
a 0 u 13 0 15 25 hln 100 VALUE=20k
part 5 r 350 380 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 33 hln 100 VALUE=150
part 145 LM324 440 340 U
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 56 8 hcn 100 REFDES=U4A
a 0 sp 11 0 26 34 hcn 100 PART=LM324
part 25 r 190 320 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R3
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 u 13 0 15 25 hln 100 VALUE=4k
part 24 r 180 380 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 13 33 hln 100 VALUE=1k
part 6 VDC 240 350 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDC
a 1 xp 9 0 24 7 hcn 100 REFDES=VDC
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 4 DbreakZ 350 410 v
a 0 sp 13 0 3 51 hln 100 MODEL=Dbreak
a 0 a 0:13 0 0 0 hln 100 PKGREF=D1
a 0 ap 9 0 9 -4 hln 100 REFDES=D1
part 156 r 350 300 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R9
a 0 ap 9 0 15 0 hln 100 REFDES=R9
a 0 u 13 0 15 25 hln 100 VALUE=14k
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 88 nodeMarker 680 320 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=R6:2
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 12
a 0 up 0:33 0 0 0 hln 100 V=
s 240 410 240 390 11
a 0 up 33 0 242 400 hlt 100 V=
w 36
a 0 up 0:33 0 0 0 hln 100 V=
s 180 380 180 410 35
a 0 up 33 0 182 395 hlt 100 V=
w 83
a 0 up 0:33 0 0 0 hln 100 V=
s 640 420 640 400 82
a 0 up 33 0 642 410 hlt 100 V=
w 125
a 0 up 0:33 0 0 0 hln 100 V=
s 270 400 270 410 112
a 0 up 33 0 272 405 hlt 100 V=
w 115
a 0 up 0:33 0 0 0 hln 100 V=
s 300 400 300 410 114
a 0 up 33 0 302 405 hlt 100 V=
w 77
a 0 up 0:33 0 0 0 hln 100 V=
a 0 sr 0 0 0 0 hln 100 LABEL=Vout
s 640 320 680 320 141
a 0 sr 3 0 660 318 hcn 100 LABEL=Vout
a 0 up 33 0 660 319 hct 100 V=
s 620 320 640 320 76
s 640 320 640 370 78
w 54
a 0 up 0:33 0 0 0 hln 100 V=
s 520 320 540 320 53
s 540 320 540 240 55
a 0 up 33 0 542 280 hlt 100 V=
s 540 240 500 240 59
s 540 240 540 200 61
s 540 200 490 200 63
s 540 320 580 320 73
w 14
a 0 sr 0 0 0 0 hln 100 LABEL=Vbias
a 0 up 0:33 0 0 0 hln 100 V=
s 350 380 420 380 37
a 0 up 33 0 407 383 hct 100 V=
a 0 sr 3 0 385 378 hcn 100 LABEL=Vbias
s 420 380 420 340 39
s 440 340 420 340 101
w 16
a 0 up 0:33 0 0 0 hln 100 V=
s 350 320 350 340 19
s 240 350 240 340 15
s 240 320 230 320 84
s 240 320 270 320 109
a 0 up 33 0 265 305 hct 100 V=
s 270 320 300 320 124
s 270 320 270 370 107
s 300 320 350 320 138
s 300 320 300 370 136
s 240 340 240 320 148
s 240 340 210 340 146
s 210 340 210 440 149
s 210 440 480 440 151
s 480 440 480 350 153
w 52
a 0 up 0:33 0 0 0 hln 100 V=
s 460 200 430 200 65
s 430 300 440 300 69
s 430 200 430 240 67
s 430 240 430 300 72
a 0 up 33 0 432 270 hlt 100 V=
s 460 240 430 240 70
s 390 300 430 300 51
w 27
a 0 up 0:33 0 0 0 hln 100 V=
s 350 300 180 300 49
a 0 up 33 0 301 273 hct 100 V=
s 180 300 180 320 28
s 180 320 180 340 86
s 190 320 180 320 26
@junction
j 240 390
+ p 6 -
+ w 12
j 240 410
+ s 7
+ w 12
j 350 380
+ p 5 1
+ w 14
j 180 380
+ p 24 1
+ w 36
j 180 410
+ s 9
+ w 36
j 640 400
+ p 81 1
+ w 83
j 640 420
+ s 10
+ w 83
j 350 410
+ s 8
+ p 4 1
j 350 380
+ p 5 1
+ p 4 2
j 350 380
+ p 4 2
+ w 14
j 490 200
+ p 48 2
+ w 54
j 460 200
+ p 48 1
+ w 52
j 500 240
+ p 47 2
+ w 54
j 540 240
+ w 54
+ w 54
j 540 320
+ w 54
+ w 54
j 580 320
+ p 75 1
+ w 54
j 460 240
+ p 47 1
+ w 52
j 430 240
+ w 52
+ w 52
j 270 400
+ p 110 1
+ w 125
j 270 410
+ s 111
+ w 125
j 300 400
+ p 116 1
+ w 115
j 300 370
+ p 116 2
+ w 16
j 300 410
+ s 117
+ w 115
j 350 340
+ p 5 2
+ w 16
j 240 350
+ p 6 +
+ w 16
j 230 320
+ p 25 2
+ w 16
j 240 320
+ w 16
+ w 16
j 270 370
+ p 110 2
+ w 16
j 270 320
+ w 16
+ w 16
j 300 320
+ w 16
+ w 16
j 430 300
+ w 52
+ w 52
j 180 340
+ p 24 2
+ w 27
j 190 320
+ p 25 1
+ w 27
j 180 320
+ w 27
+ w 27
j 620 320
+ p 75 2
+ w 77
j 640 370
+ p 81 2
+ w 77
j 680 320
+ p 88 pin1
+ w 77
j 240 340
+ w 16
+ w 16
j 390 300
+ p 156 2
+ w 52
j 350 300
+ p 156 1
+ w 27
j 520 320
+ p 145 OUT
+ w 54
j 440 340
+ p 145 +
+ w 14
j 440 300
+ p 145 -
+ w 52
j 480 350
+ p 145 V+
+ w 16
j 480 290
+ s 155
+ p 145 V-
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
