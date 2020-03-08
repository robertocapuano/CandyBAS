1 SCREEN1,0,0:COLOR10,9,9:KEYOFF:DEFINTA-Z:C=1:R=0:B=6347:X=B:Z=RND(-TIME):P=0:locate10,10:?"CandyBAS";:K$=INPUT$(1):CLS
2 S=1+31*(Rmod2):Y=X-S:Z=X+S:T=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T:W=W-1:PLAY"T120O4L15"+CHR$(69+W):ifW=0thenP=P-1
3 forI=0to3:locate6+I*5,22:?S(I);:vpoke6855+5*(I),I+1:nextI:H=0:FORI=0TO4:G=B+I*2:ifvpeek(G)=32thenvpokeG,RND(1)*4+1
4 locate1,0:?"HIGH "E" "tab(20)"PTS "P" ":forJ=4TO1step-1:A=G+J*64:ifvpeek(A)=32thenvpokeA,vpeek(A-64):vpokeA-64,32:H=1
5 nextJ,I:ifH=1then3else:M1$="T120O4L15A":U=64:V=2:forK=0to1:forJ=0TO4:forI=0TO2:A=B+J*V+I*U:T=vpeek(A):N=0 
6 N=N+1:ifT<32andT=vpeek(A+N*U)then6:elseifN>2thenforM=0toN-1:vpokeA+M*U,32:S(T-1)=S(T-1)+1:next:playM1$+CHR$(65-H+N)
7 H=H-(N>2):nextI,J:swapU,V:nextK:ifH>0thenP=P+H:E=E-(P>E)*H:W=0:goto3:elseifW>0then2:elseW=2
8 MC$="T250O4L11D":X=B+C+R*32:vpokeX,254:K$=INKEY$:IFK$=""then8:elsevpokeX,32:ifK$=" "andC<9then2
9 MR$="T250O4L11C":k=ASC(k$)::ifK=31andr<8thenR=R+1:C=Cxor1:playMR$:elseifK=30andR>0thenR=R-1:C=Cxor1:playMR$
10 ifK=27theneraseS:W=0:goto1:elseifK=28andC<7thenC=C+2:playMC$:goto8:elseifK=29andC>1thenC=C-2:playMC$:goto8:else8
