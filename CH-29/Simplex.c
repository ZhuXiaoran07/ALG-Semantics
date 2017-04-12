//P871
SIMPLEX(A,b,c)
(N,B,A,b,c,v)=INITIALIZE-SIMPLEX(A,b,c)
let DELTA be a new vector of length n
while some index j belongsto N has c[j]>0{
	choose an index e belongsto N for which c[e]>0
	for each index i belongsto B{
		if a[i][e]>0
			DELTAi=b[i]/a[i][e]
		else DELTA[i]=INFINITY
		choose an index l belongsto B that minimizes DELTA[i]
		if DELTA[l]==INFINITY
			return "unbounded"
		else (N,B,A,b,c,v)=PIVOT(N,B,A,b,c,v,l,e)}}
for i=1 to n{
	if i belongsto B
		x'[i]=b[i]
	else x'[i]=0}
return (x'[1],x'[2],...,x'[n])
	