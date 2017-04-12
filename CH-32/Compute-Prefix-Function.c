//P1006
COMPUTEPREFIXFUNCTION(P)
m=P.length
let pi[1..m] be a new array
pi[1]=0
k=0
for q=2 to m{
	while k>0 and P[k+1]!=P[q]{
	k=pi[k]}
	if P[k+1]==P[q]
		k=k+1
pi[q]=k}
return pi