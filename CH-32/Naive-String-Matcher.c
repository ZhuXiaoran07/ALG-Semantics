//P988
NAIVESTRINGMATHCER(T,P)
n=T.length
m=P.length
for s=0 to n-m
	if P[1..m]==T[s+1..s+m]
		print "Pattern occurs with shift s"