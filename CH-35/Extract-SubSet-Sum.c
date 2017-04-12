//P1129
//change
EXTRACTSUBSETSUM(S,t)
n=|S|
L[0]=0
for i=1 to n{
	L[i]=MERGERLISTS(L[i]-1, L[i]-1 + x[i])
    REMOVE(L[i],t)}
	//remove from L[i] every element that is greater than t}
return maximum(L[n])