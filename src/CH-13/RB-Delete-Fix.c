//P326
RB-DELETE-FIXUP(T,x)
1 while x!=T.root and x.color==BLACK{
2 	if x==x.p.left{
3 		w=x.p.right
4 	    if w.color==RED{
5 			w.color=BLACK		//case 1
6 			x.p.color=RED		//case 1
7 			LEFT-ROTATE(T,x.p)	//case 1
8 			w=x.p.right}		//case 1
9 		if w.left.color==BLACK and w.right.color==BLACK{
10 			w.color=RED			//case 2
11 			x=x.p}				//case 2
12 		elseif w.right.color==BLACK{
13 			w.left.color=BLACK	//case 3
14 			w.color=RED			//case 3
15			RIGHT-ROTATE(T,w)	//case 3
16 			w=x.p.right}		//case 3
17 		  w.color=x.p.color		//case 4
18		  x.p.color=BLACK		//case 4
19 		  w.right.color=BLACK	//case 4
20 		  LEFT-ROTATE(T,x.p)	//case 4
21 		  x=T.root}				//case 4
22   else{same as then clause with "right" and "left" exchanged}}
23 x.color=BLACK