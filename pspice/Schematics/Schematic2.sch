*version 9.1 365976613
u 33
R? 4
V? 2
? 3
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
pageloc 1 0 2063 
@status
n 0 118:08:21:15:41:01;1537537261 e 
s 2832 118:08:21:15:41:02;1537537262 e 
*page 1 0 970 720 iA
@ports
port 5 AGND 320 250 h
@parts
part 4 VDC 220 150 d
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=10V
part 3 r 340 150 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=4
part 23 r 340 190 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R3
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 u 13 0 15 25 hln 100 VALUE=5
part 2 r 260 150 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=10
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 21 nodeMarker 420 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 7
a 0 up 0:33 0 0 0 hln 100 V=
s 220 150 260 150 6
a 0 up 33 0 240 149 hct 100 V=
w 9
a 0 up 0:33 0 0 0 hln 100 V=
s 300 150 330 150 8
a 0 up 33 0 320 149 hct 100 V=
s 330 150 340 150 28
s 330 150 330 190 26
s 330 190 340 190 29
w 11
a 0 up 0:33 0 0 0 hln 100 V=
s 380 150 420 150 10
s 420 150 420 210 12
s 420 210 320 210 14
s 180 210 180 150 16
s 320 210 180 210 20
a 0 up 33 0 250 209 hct 100 V=
s 320 210 320 250 18
s 380 190 380 150 31
@junction
j 260 150
+ p 2 1
+ w 7
j 340 150
+ p 3 1
+ w 9
j 300 150
+ p 2 2
+ w 9
j 380 150
+ p 3 2
+ w 11
j 320 250
+ s 5
+ w 11
j 320 210
+ w 11
+ w 11
j 420 150
+ p 21 pin1
+ w 11
j 220 150
+ p 4 +
+ w 7
j 180 150
+ p 4 -
+ w 11
j 330 150
+ w 9
+ w 9
j 340 190
+ p 23 1
+ w 9
j 380 190
+ p 23 2
+ w 11
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
