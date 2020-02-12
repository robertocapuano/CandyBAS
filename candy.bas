1 SCREEN1,0:COLOR10,9,9:CLS:KEYOFF:DEFINTA-Z:C=1:R=0:B=6283:Z=RND(-TIME)
40 H=0:FORI=0TO4:A=B+I*2:ifvpeek(A)=32thenvpokeA,RND(1)*4+1:H=1:next:elsenext
50 FOR J=4TO1step-1:FOR I=0TO4:A=B+I*2+J*64:m=vpeek(A):ifm=32thenvpokeA,vpeek(A-64):vpokeA-64,32:H=1
51 nextI,J:if H=1then40
55 FORJ=0TO4:FOR I=0TO2:A=B+I*2+J*64:T=vpeek(A):ifT=vpeek(A+2)andT=vpeek(A+4)thenvpokeA,32:vpokeA+2,32:vpokeA+4,32::H=1
56 nextI,J
57 FOR J=0TO4:FOR I=0TO2:A=B+J*2+I*64:T=vpeek(A):if T=vpeek(A+64)andT=vpeek(A+128)thenvpokeA,32:vpokeA+64,32:vpokeA+128,32:H=1
58 nextI,J:ifH=1then40elseT=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T:
60 X=B+C+R*32:Y=X:Z=X:vpokeX,42:K$=INKEY$:IFK$=""THEN60:elsevpokeX,32
130 ifK$=CHR$(28)andc<7thenC=C+2:elseifK$=CHR$(29)and C>1then C=C-2 
150 ifK$=CHR$(31)andr<8thenR=R+1:C=Cxor1:elseifK$=CHR$(30)andR>0thenR=R-1:C=Cxor1
170 if K$<>" "orC=9then60elseif(Rmod2)=1then Y=X-32:Z=X+32:else Y=X-1:Z=X+1:
180 T=vpeek(Y):vpoke Y,vpeek(Z):vpokeZ,T:goto40


----

130 if K$=CHR$(28) then if C>=7 then C=1-R MOD 2:else C=C+2
135 if K$=CHR$(29) then if C<=1 then C=7+R MOD 2:else C=C-2 
150 if K$=CHR$(31) then if R=8 then R=0: else C=C+R MOD 2-C MOD 2:R=R+1:if C=9 then C=7
155 if K$=CHR$(30) then if R=0 then R=8: else C=C+R MOD 2-C MOD 2:R=R-1:if C=9 then C=7

----

print chr$(27)+"p";"Inverted Text"

if peek(&HFBEB)and2 then else ?"CTRL pressed"


170 if K$=" " then  H=1: X=2+1+B+C*2+R*2*32;S0=vpeek(  B+I*2+2  I1%=R1%*5+C1%:I0%=R0%*5+C0%:SWAP M%(I0%),M%(I1%): H=1
190 if H=0 then 300

1 SCREEN1,0:COLOR 10,9,9:CLS:KEY OFF:C1%=0:R1%=0:C0%=0:R0%=0:R=0:C=0:B=6144
30 PRINT CHR$(27)+CHR$(121)+CHR$(53)

40 FOR I=0 TO 4: X=B+I*2+2: m=vpeek(X): if m=32 then vpoke X, RND(1)*4+1
41 next i:locate R1+1,C1
50 FOR J=4 TO 1step-1 :FOR I=0TO 4: X=B+I*2+J*2*32:m=vpeek(X): if m=32 then vpoke X, vpeek(X-64): vpoke X-64, 32
51 next i:next J

100 goto 40




30 PRINT CHR$(27)+CHR$(120)+CHR$(53)

1 SCREEN1,0:COLOR 10,9,9:CLS:KEY OFF:

3 PRINT CHR$(1)+CHR$(65):PRINT CHR$(27)+CHR$(121)+CHR$(53):locate 0,0
4 print vpeek(6144+2)


1 SCREEN1,0:COLOR 10,9,9:CLS:KEY OFF:C1%=0:R1%=0:C0%=0:R0%=0
10 SX%=16:SY%=-1:SL%=16:
12 R=0:C=0:DIM M%(25):
30 PRINT CHR$(27)+CHR$(121)+CHR$(53)
100 for i=0to24:m%(i)=RND(1)*4:next
200 FOR I=4 TO 1step-1 :FOR J=0TO 4:if M%(i*5+J)=-1 then swap m%(i*5+J),M%((i-1)*5+J):H=1
201 NEXT J:NEXT I:
210 for i=0 to4: if m%(i)=-1 then m%(i)=RND(1)*4
220 next

230 k=0:FOR I=0 TO 4 :FOR J=0TO 4:LOCATE I*2,J*2:PRINT CHR$(1)+CHR$(65+M%(k)):K=K+1:NEXT J:NEXT I:
300 LOCATEC0%*2,R0%*2::LOCATEC1%*2,R1%*2::K$=INKEY$: 
330 IF K$="" THEN  300
400 if K$=CHR$(28) then R0%=R1%:C0%=C1%:C1%=(C1%+1)mod5
410 if K$=CHR$(29) then R0%=R1%:C0%=C1%::C1%=C1%-1 : IF C1%<0 then C1%=4:
420 if K$=CHR$(31) then R0%=R1%:C0%=C1%::R1%=(R1%+1)mod5 
430 if K$=CHR$(30) then R0%=R1%:C0%=C1%::R1%=R1%-1: IF R1%<0 then R1%=4:
440 if K$=" " then I1%=R1%*5+C1%:I0%=R0%*5+C0%:SWAP M%(I0%),M%(I1%): H=1
450 IF R1%<0 then R1%=4:else if C1%<0 then C1%=4: 
460 if H=0 then 300
500 for i%=0to14:if M%(i%)=M%(i%+5) and M%(i%+5)=M%(i%+10) then M%(i%)=-1:M%(i%+5)=-1:M%(i%+10)=-1:
600 next:i%=0
700 if M%(i%)=M%(i%+1) and M%(i%+1)=M%(i%+2) then M%(i%)=-1:M%(i%+1)=-1:M%(i%+2)=-1:
800 if (i% mod 5)=2 then i%=i%+3 else i%=i%+1
900 if (i%<23) then 700

950 if H=1 then H=0:goto 200: else 300





400 if K$=CHR$(28)then C1%=(C1%+1)mod5:C0%=-1:else if K$=CHR$(30) then R1%=R1%-1:R0%=+1
410 if K$=CHR$(29) then C1%=C1%-1:C0%=+1:else if K$=CHR$(31)then R1%=(R1%+1)mod5:R0%=-1:
430 IF R1%<0 then R1%=4:else if C1%<0 then C1%=4: 
440 goto 300

420 if K$=" " then SWAP M%(I0%),M%(I1%): goto 6

  color auto  goto  list  run

1 screen1,0:COLOR 10,9,9:CLS
10 SX%=16:SY%=-1:SL%=16:
12 R=0:C=0:DIM M%(25):
20 SP$="":FOR N%=1 TO 8:READ K%:SP$=SP$+CHR$(K%):NEXT:SPRITE$(0)=SP$
60 X%=C1%*SL%+SX%:Y%=R1%*SL%+SY%:CL%=M%(I%)
70 PUT SPRITE 0,(X%,Y%),15,0

200 FOR I=0 TO  8:FOR J=0TO 8:LOCATE I*2,J*2:PRINT CHR$(1)+CHR$(65+RND(1)*4)
300 NEXT J:NEXT I
   
1000 DATA 255,129,129,129,129,129,129,255






