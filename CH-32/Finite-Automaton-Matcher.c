//P999
FINITEAUTOMATONMATCHER(T, TF, m)
n=T.length
q=0
for i=1 to n{
	q=TF(q,T[i])
	if q==m
		print "Pattern occurs with shift" i-m}