*version 9.1 139921914
u 67
R? 6
V? 2
? 2
@libraries
@analysis
.TRAN 1 0 0 0
+0 1us
+1 100ms
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
pageloc 1 0 1839 
@status
n 0 118:08:21:15:14:12;1537535652 e 
s 2832 118:08:21:15:14:12;1537535652 e 
*page 1 0 970 720 iA
@ports
port 9 AGND 300 230 h
@parts
part 13 VDC 210 130 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 3 r 300 210 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
part 60 POT 300 130 v
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R5
a 0 ap 9 0 15 0 hln 100 REFDES=R5
a 0 sp 11 0 25 35 hln 100 PART=POT
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 28 nodeMarker 340 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 22
a 0 up 0:33 0 0 0 hln 100 V=
s 300 230 300 220 25
s 300 220 300 210 40
s 210 170 210 220 41
s 210 220 300 220 43
a 0 up 33 0 255 219 hct 100 V=
w 46
a 0 up 0:33 0 0 0 hln 100 V=
a 0 sr 0 0 0 0 hln 100 LABEL=Vout
s 300 150 340 150 6
a 0 sr 3 0 320 148 hcn 100 LABEL=Vout
a 0 up 33 0 320 149 hct 100 V=
s 300 150 300 170 8
s 300 130 300 150 51
w 59
a 0 up 0:33 0 0 0 hln 100 V=
s 300 80 300 90 49
s 210 80 300 80 47
a 0 up 33 0 255 79 hct 100 V=
s 210 130 210 80 45
s 300 80 340 80 61
s 340 80 340 110 63
s 340 110 320 110 65
@junction
j 300 210
+ p 3 1
+ w 22
j 300 230
+ s 9
+ w 22
j 300 220
+ w 22
+ w 22
j 210 170
+ p 13 -
+ w 22
j 210 130
+ p 13 +
+ w 59
j 300 150
+ w 46
+ w 46
j 300 170
+ p 3 2
+ w 46
j 340 150
+ p 28 pin1
+ w 46
j 300 130
+ p 60 1
+ w 46
j 300 90
+ p 60 2
+ w 59
j 300 80
+ w 59
+ w 59
j 320 110
+ p 60 t
+ w 59
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
