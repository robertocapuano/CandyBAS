1 SCREEN1:COLOR10,9,9:KEYOFF:DEFINTA-Z:C=1:R=0:B=6347:X=B:Z=RND(-TIME):U=64:V=2:P=0:?TAB(10)"CandyBAS";:K$=INPUT$(1):CLS
2 S=1+31*(Rmod2):Y=X-S:Z=X+S:T=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T:W=W-1:PLAY"L15"+CHR$(69+W):ifW=0thenP=0
3 locate21,0:?"PTS "P" ":locate1,0:?"HIGH "E" ":H=0:FORI=0TO4:G=B+I*2:ifvpeek(G)=32thenvpokeG,RND(1)*4+1
4 forJ=4TO1step-1:A=G+J*64:ifvpeek(A)=32thenvpokeA,vpeek(A-64):vpokeA-64,32:H=1
5 nextJ,I:ifH=1then3elseforK=0to1:forJ=0TO4:forI=0TO2:A=B+J*V+I*U:T=vpeek(A):N=0
6 N=N+1:ifT<32andT=vpeek(A+N*U)then6:elseifN>2thenforM=0toN-1:vpokeA+M*U,32:next:PLAY"L15A"+CHR$(65+H+N):remPLAY"L15A":
7 H=H-(N>2):nextI,J:swapU,V:next:ifH>0thenP=P+H:E=E-(P>E)*H:W=0:goto3:elseifW>0then2:elseW=2
8 X=B+C+R*32:vpokeX,254:K$=INKEY$:IFK$=""then8:elsevpokeX,32:ifK$=" "andC<9then2
9 k=ASC(k$):ifK=31andr<8thenR=R+1:C=Cxor1:elseifK=30andR>0thenR=R-1:C=Cxor1
10 ifK=27then1:elseifK=28andC<7thenC=C+2:goto8:elseifK=29andC>1thenC=C-2:goto8:else8
