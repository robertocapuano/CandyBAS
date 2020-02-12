1 SCREEN1:COLOR10,9,9:CLS:KEYOFF:DEFINTA-Z:C=1:R=0:B=6283:Z=RND(-TIME):U=64:V=2
2 H=0:FORI=0TO4:A=B+I*2:ifvpeek(A)=32thenvpokeA,RND(1)*4+1:H=1:next:elsenext
3 forJ=4TO1step-1:forI=0TO4:A=B+I*2+J*64:ifvpeek(A)=32thenvpokeA,vpeek(A-64):vpokeA-64,32:H=1
4 nextI,J:if H=1then2:elseforK=0to1:swapU,V:forJ=0TO4:forI=0TO2:A=B+J*V+I*U:T=vpeek(A)
5 ifT=vpeek(A+U)andT=vpeek(A+2*U)thenvpokeA,32:vpokeA+U,32:vpokeA+2*U,32:H=1
6 nextI,J,K:ifH=1then2elseT=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T
7 X=B+C+R*32:Y=X:Z=X:vpokeX,42:K$=INKEY$:IFK$=""then7:elsevpokeX,32
8 ifK$=CHR$(31)andr<8thenR=R+1:C=Cxor1:elseifK$=CHR$(30)andR>0thenR=R-1:C=Cxor1
9 ifK$=CHR$(28)andc<7thenC=C+2:elseifK$=CHR$(29)andC>1thenC=C-2
10 ifK$<>" "orC=9then7elseS=1+31*(Rmod2):Y=X-S:Z=X+S:T=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T:goto2
