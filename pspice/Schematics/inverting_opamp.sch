*version 9.1 49980878
u 214
R? 6
V? 4
C? 5
? 3
U? 2
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
pageloc 1 0 3784 
@status
n 0 119:02:05:16:02:20;1551798140 e 
s 0 119:02:05:16:02:20;1551798140 e 
c 119:02:05:16:02:17;1551798137
*page 1 0 970 720 iA
@ports
port 11 AGND 420 240 h
a 1 x 3 0 14 20 hln 100 LABEL=GND
port 187 GND_ANALOG 270 340 h
port 109 AGND 340 340 h
a 1 x 3 0 14 20 hln 100 LABEL=GND
@parts
part 170 c 490 380 h
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 10 25 hln 100 VALUE=47p
a 0 x 0:13 0 0 0 hln 100 PKGREF=C1
a 0 xp 9 0 10 0 hln 100 REFDES=C1
part 183 OPAMP 460 240 h
a 0 u 0:13 0 20 72 hlb 100 GAIN=1
a 0 sp 11 0 50 60 hln 100 PART=OPAMP
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 14 0 hln 100 REFDES=U1
part 9 r 480 330 h
a 0 u 13 0 15 0 hln 100 VALUE=10k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=R_feedback
a 0 xp 9 0 0 25 hln 100 REFDES=R_feedback
part 186 r 270 330 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R5
a 0 ap 9 0 15 0 hln 100 REFDES=R5
part 6 r 400 280 u
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=R_flexiforce
a 0 xp 9 0 35 0 hln 100 REFDES=R_flexiforce
a 0 u 13 0 25 30 hln 100 VALUE=600k
part 185 r 280 280 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R4
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 u 13 0 15 25 hln 100 VALUE=4k
part 206 VDC 340 300 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V3
a 1 ap 9 0 24 7 hcn 100 REFDES=V3
a 1 u 13 0 -11 18 hcn 100 DC=-5V
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 107 nodeMarker 630 260 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 15
a 0 up 0:33 0 0 0 hln 100 V=
a 0 sr 0:3 0 655 178 hcn 100 LABEL=V_out
s 590 260 630 260 155
a 0 sr 3 0 620 273 hcn 100 LABEL=V_out
s 540 260 590 260 24
a 0 up 33 0 600 244 hct 100 V=
s 590 330 590 260 158
s 520 330 590 330 22
s 590 380 590 330 177
s 520 380 590 380 175
w 98
a 0 up 0:33 0 0 0 hln 100 V=
s 420 240 460 240 99
a 0 up 33 0 440 225 hct 100 V=
w 189
a 0 up 0:33 0 0 0 hln 100 V=
s 270 330 270 340 188
a 0 up 33 0 272 335 hlt 100 V=
w 179
a 0 up 0:33 0 0 0 hln 100 V=
s 420 280 420 330 37
a 0 up 33 0 425 351 hlt 100 V=
s 480 330 420 330 33
s 420 280 460 280 153
s 400 280 420 280 85
s 420 330 420 380 171
s 420 380 490 380 173
w 191
a 0 up 0:33 0 0 0 hln 100 V=
s 360 260 360 280 198
s 280 280 270 280 190
s 270 280 270 290 192
s 270 280 270 260 208
s 270 260 360 260 210
a 0 up 33 0 261 239 hct 100 V=
w 200
a 0 up 0:33 0 0 0 hln 100 V=
s 340 300 340 280 112
s 340 280 320 280 203
a 0 up 33 0 246 261 hct 100 V=
@junction
j 420 240
+ s 11
+ w 98
j 630 260
+ p 107 pin1
+ w 15
j 590 260
+ w 15
+ w 15
j 520 330
+ p 9 2
+ w 15
j 480 330
+ p 9 1
+ w 179
j 400 280
+ p 6 1
+ w 179
j 420 280
+ w 179
+ w 179
j 420 330
+ w 179
+ w 179
j 590 330
+ w 15
+ w 15
j 520 380
+ p 170 2
+ w 15
j 490 380
+ p 170 1
+ w 179
j 540 260
+ p 183 OUT
+ w 15
j 460 280
+ p 183 -
+ w 179
j 460 240
+ p 183 +
+ w 98
j 270 330
+ p 186 1
+ w 189
j 270 340
+ s 187
+ w 189
j 360 280
+ p 6 2
+ w 191
j 320 280
+ p 185 2
+ w 200
j 340 340
+ p 206 -
+ s 109
j 340 300
+ p 206 +
+ w 200
j 270 280
+ w 191
+ w 191
j 280 280
+ p 185 1
+ w 191
j 270 290
+ p 186 2
+ w 191
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
