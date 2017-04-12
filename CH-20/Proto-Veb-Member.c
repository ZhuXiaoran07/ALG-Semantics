//P541
PROTOVEBMEMBER(V,x)
if V.u==2
	return V.A[x]
else return PROTOVEBMEMBER(V.cluster[high(x)],low)