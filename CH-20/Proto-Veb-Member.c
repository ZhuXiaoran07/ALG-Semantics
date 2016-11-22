//P541
PROTO-VEB-MEMBER(V,x)
if V.u==2
	return V.A[x]
else return PROTO-VEB-MEMBER(V.cluster[high(x)],low)