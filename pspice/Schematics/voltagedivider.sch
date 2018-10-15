*version 9.1 625326644
u 43
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
*page 1 0 970 720 iA
@ports
port 27 AGND 350 410 h
@parts
part 21 VDC 350 270 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=3.3V
part 2 r 440 200 d
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=Rflexiforce
a 0 xp 9 0 25 0 hln 100 REFDES=Rflexiforce
a 0 u 13 0 25 35 hln 100 VALUE=0.5M
part 10 r 440 360 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 35 hln 100 REFDES=R1
a 0 u 13 0 15 0 hln 100 VALUE=1M
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 28 nodeMarker 550 290 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=Vout
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 4
a 0 sr 0 0 0 0 hln 100 LABEL=Vout
a 0 up 0:33 0 0 0 hln 100 V=
s 440 290 550 290 5
a 0 sr 3 0 530 283 hcn 100 LABEL=Vout
a 0 up 33 0 530 284 hct 100 V=
s 440 240 440 290 3
s 440 290 440 320 32
w 16
a 0 up 0:33 0 0 0 hln 100 V=
s 350 170 350 270 19
a 0 up 33 0 352 220 hlt 100 V=
s 440 170 350 170 17
s 440 200 440 170 15
w 37
a 0 up 0:33 0 0 0 hln 100 V=
s 350 310 350 400 23
a 0 up 33 0 352 360 hlt 100 V=
s 440 360 440 400 13
a 0 up 33 0 442 385 hlt 100 V=
s 350 400 350 410 41
s 440 400 350 400 39
@junction
j 440 240
+ p 2 2
+ w 4
j 550 290
+ p 28 pin1
+ w 4
j 440 290
+ w 4
+ w 4
j 350 410
+ s 27
+ w 37
j 350 310
+ p 21 -
+ w 37
j 350 270
+ p 21 +
+ w 16
j 440 200
+ p 2 1
+ w 16
j 440 320
+ p 10 2
+ w 4
j 440 360
+ p 10 1
+ w 37
j 350 400
+ w 37
+ w 37
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
