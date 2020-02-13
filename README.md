# CandyBAS
 Candy Crush in 10 line of MSX2 BASIC

# Game Logic
Player must find the character that repeats X times in the matrix.

# Controls

Sources are stored at: https://github.com/robertocapuano/PazBAS

# Installation
Game was developed on a MSX-BASIC v3 on a MSX2+ emulator at https://webmsx.org/
1. connect to https://webmsx.org/
2. click on the first floppy icon below the blue screen
3. Select "Add Disk Images"
4. Choose "candy.dsk"
5. type in:
```
load "a:candy.bas"
run
```

otherwise
1. connect to https://webmsx.org/
2. click on the first floppy icon below the blue screen
3. Select "Add Disk Images"
4. Choose "candy.dsk"

# Source Description

```
1 SCREEN1:COLOR10,9,9:CLS:KEYOFF:DEFINTA-Z:C=1:R=0:B=6283:Z=RND(-TIME):U=64:V=2
```
```
2 F$=CHR$(28):H=0:FORI=0TO4:G=B+I*2:ifvpeek(G)=32thenvpokeG,RND(1)*4+1
```
```
3 forJ=4TO1step-1:A=G+J*64:ifvpeek(A)=32thenvpokeA,vpeek(A-64):vpokeA-64,32:H=1
```
```
4 nextJ,I:ifH=1then2elseforK=0to1:forJ=0TO4:forI=0TO2:A=B+J*V+I*U:T=vpeek(A)
```
```
5 ifT=vpeek(A+U)andT=vpeek(A+2*U)thenvpokeA,32:vpokeA+U,32:vpokeA+2*U,32:H=1:Y=Z
```
```
6 nextI,J:swapU,V:nextK:ifH=1then2elseT=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T
```
```
7 X=B+C+R*32:Y=X:Z=X:vpokeX,254:K$=INKEY$:IFK$=""then7:elsevpokeX,32
```
```
8 ifK$=CHR$(31)andr<8thenR=R+1:C=Cxor1:elseifK$=CHR$(30)andR>0thenR=R-1:C=Cxor1
```
```
9 ifK$=F$andc<7thenC=C+2:elseifK$=CHR$(29)andC>1thenC=C-2:elseS=1+31*(Rmod2)
```
```
10 ifK$<>" "orC=9then7else:Y=X-S:Z=X+S:T=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T:goto2
```
