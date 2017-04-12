//P1001
COMPUTETRANSITIONFUNCTION(P,SIG)
m=P.length
for q=0 to m{
	for each character a belongsto SIG{
		k=min(m+1,q+2)
		repeat
			k=k-1
		until Pk > Pqa// change
TF(q,a)=k}}
return TF