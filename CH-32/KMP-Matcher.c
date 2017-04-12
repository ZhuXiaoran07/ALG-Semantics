//P1005
KMPMATCHER(T,P)
n=T.length
m=P.length
pi=COMPUTEPREFIXFUNCTION(P)
q=0
for i=1 to n{
	while q>0 and P[q+1]!=T[i]
		q=pi[q]
	if P[q+1]==T[i]
		q=q+1
	if q==m{
		print "Pattern occurs with shift" i-m
q=pi[q]}} 