//P544
PROTOVEBINSERT(V,x)
if V.u==2
	V.A[x]=1
else{PROTOVEBINSERT(V.cluster[high(x)],low(x))
	 PROTOVEBINSERT(V.summary, high(x))}