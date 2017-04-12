//P1126
APPROXMINWEIGHTVC(G,w)
C=EMPTY
//compute x', an optimal solution to the linear program in lines (35.17)-(35.20)
for each v belongsto V
	if x'(v)>=1/2
		C=C SUNION {v}
return C