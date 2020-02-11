1 SCREEN1,0:COLOR 10,9,9:CLS:KEY OFF:C%=1:R%=0:BA%=6144:CH=0
40 ch=0:FOR I=0 TO 4: II%=2+BA%+I*2: m=vpeek(II%): if m=32 then vpoke II%, RND(1)*4+1: ch=1
41 next i
50 FOR J=4 TO 1step-1 :FOR I=0TO 4: II%=2+BA%+I*2+J*2*32:m=vpeek(II%): if m=32 then vpoke II%, vpeek(II%-64): vpoke II%-64, 32:ch=1
51 next i:next J: if ch=1 then 40
60 II%=2+BA%+C%+R%*32: vpoke II%,42:IJ%=II%:IK%=II%:
110 KR$=INKEY$:IF KR$="" THEN 110 : else  vpoke II%, 32:
130 if KR$=CHR$(28) then if C%>=7 then c%=1-R% MOD 2: else C%=C%+2
135 if KR$=CHR$(29) then if C%<=1 then c%=7+R% MOD 2: else C%=C%-2 
150 if KR$=CHR$(31) then if R%=8 then R%=0 : else C%=C% + R% MOD 2 -  C% MOD 2 :R%=R%+1: if C%=9 then C%=7
155 if KR$=CHR$(30) then if R%=0 then R%=8 : else C%=C% + R% MOD 2 -  C% MOD 2 : R%=R%-1: if C%=9 then C%=7
160 rem IF R%<0 then R%=10:else if C%<0 then C%=10: else if C%>10 then C%=2: else if R%>9 then R%=1
170 if KR$<>" " then 300 else if (R%mod2)=1 then IJ%=II%-32:IK%=II%+32: else  IJ%=II%-1:IK%=II%+1:
180 IF IJ%<>IK% then T=VPEEK(IJ%):VPOKE IJ%,VPEEK(IK%):VPOKE IK%,T

250 FOR J=0 TO 4:FOR I=0TO 2: II%=2+BA%+I*2+J*2*32:T=vpeek(II%): if T=VPEEK(II%+2) and T=VPEEK(II%+4) then vpoke II%, 32: vpoke II%+2, 32: vpoke II%+4, 32: : ch=1
251 next i:next J
260 FOR J=0 TO 4:FOR I=0TO 2: II%=2+BA%+J*2+I*2*32:T=vpeek(II%): if T=VPEEK(II%+64) and T=VPEEK(II%+128) then vpoke II%, 32: vpoke II%+64, 32: vpoke II%+128,32: ch=1
261 next i:next J
300 if ch=0 then 60: else 40


----

print chr$(27)+"p";"Inverted Text"

if peek(&HFBEB)and2 then else ?"CTRL pressed"


170 if KR$=" " then  CH=1: II%=2+1+BA%+C%*2+R%*2*32;S0=vpeek(  BA%+I*2+2  I1%=R1%*5+C1%:I0%=R0%*5+C0%:SWAP M%(I0%),M%(I1%): CH=1
190 if ch=0 then 300

1 SCREEN1,0:COLOR 10,9,9:CLS:KEY OFF:C1%=0:R1%=0:C0%=0:R0%=0:R%=0:C%=0:BA%=6144
30 PRINT CHR$(27)+CHR$(121)+CHR$(53)

40 FOR I=0 TO 4: II%=BA%+I*2+2: m=vpeek(II%): if m=32 then vpoke II%, RND(1)*4+1
41 next i:locate R1+1,C1
50 FOR J=4 TO 1step-1 :FOR I=0TO 4: II%=2+BA%+I*2+J*2*32:m=vpeek(II%): if m=32 then vpoke II%, vpeek(II%-64): vpoke II%-64, 32
51 next i:next J

100 goto 40




30 PRINT CHR$(27)+CHR$(120)+CHR$(53)

1 SCREEN1,0:COLOR 10,9,9:CLS:KEY OFF:

3 PRINT CHR$(1)+CHR$(65):PRINT CHR$(27)+CHR$(121)+CHR$(53):locate 0,0
4 print vpeek(6144+2)


1 SCREEN1,0:COLOR 10,9,9:CLS:KEY OFF:C1%=0:R1%=0:C0%=0:R0%=0
10 SX%=16:SY%=-1:SL%=16:
12 R%=0:C%=0:DIM M%(25):
30 PRINT CHR$(27)+CHR$(121)+CHR$(53)
100 for i=0to24:m%(i)=RND(1)*4:next
200 FOR I=4 TO 1step-1 :FOR J=0TO 4:if M%(i*5+J)=-1 then swap m%(i*5+J),M%((i-1)*5+J):ch=1
201 NEXT J:NEXT I:
210 for i=0 to4: if m%(i)=-1 then m%(i)=RND(1)*4
220 next

230 k=0:FOR I=0 TO 4 :FOR J=0TO 4:LOCATE I*2,J*2:PRINT CHR$(1)+CHR$(65+M%(k)):K=K+1:NEXT J:NEXT I:
300 LOCATEC0%*2,R0%*2::LOCATEC1%*2,R1%*2::KR$=INKEY$: 
330 IF KR$="" THEN  300
400 if KR$=CHR$(28) then R0%=R1%:C0%=C1%:C1%=(C1%+1)mod5
410 if KR$=CHR$(29) then R0%=R1%:C0%=C1%::C1%=C1%-1 : IF C1%<0 then C1%=4:
420 if KR$=CHR$(31) then R0%=R1%:C0%=C1%::R1%=(R1%+1)mod5 
430 if KR$=CHR$(30) then R0%=R1%:C0%=C1%::R1%=R1%-1: IF R1%<0 then R1%=4:
440 if KR$=" " then I1%=R1%*5+C1%:I0%=R0%*5+C0%:SWAP M%(I0%),M%(I1%): CH=1
450 IF R1%<0 then R1%=4:else if C1%<0 then C1%=4: 
460 if ch=0 then 300
500 for i%=0to14:if M%(i%)=M%(i%+5) and M%(i%+5)=M%(i%+10) then M%(i%)=-1:M%(i%+5)=-1:M%(i%+10)=-1:
600 next:i%=0
700 if M%(i%)=M%(i%+1) and M%(i%+1)=M%(i%+2) then M%(i%)=-1:M%(i%+1)=-1:M%(i%+2)=-1:
800 if (i% mod 5)=2 then i%=i%+3 else i%=i%+1
900 if (i%<23) then 700

950 if ch=1 then ch=0:goto 200: else 300





400 if KR$=CHR$(28)then C1%=(C1%+1)mod5:C0%=-1:else if KR$=CHR$(30) then R1%=R1%-1:R0%=+1
410 if KR$=CHR$(29) then C1%=C1%-1:C0%=+1:else if KR$=CHR$(31)then R1%=(R1%+1)mod5:R0%=-1:
430 IF R1%<0 then R1%=4:else if C1%<0 then C1%=4: 
440 goto 300

420 if KR$=" " then SWAP M%(I0%),M%(I1%): goto 6

  color auto  goto  list  run

1 screen1,0:COLOR 10,9,9:CLS
10 SX%=16:SY%=-1:SL%=16:
12 R%=0:C%=0:DIM M%(25):
20 SP$="":FOR N%=1 TO 8:READ K%:SP$=SP$+CHR$(K%):NEXT:SPRITE$(0)=SP$
60 X%=C1%*SL%+SX%:Y%=R1%*SL%+SY%:CL%=M%(I%)
70 PUT SPRITE 0,(X%,Y%),15,0

200 FOR I=0 TO  8:FOR J=0TO 8:LOCATE I*2,J*2:PRINT CHR$(1)+CHR$(65+RND(1)*4)
300 NEXT J:NEXT I
   
1000 DATA 255,129,129,129,129,129,129,255






