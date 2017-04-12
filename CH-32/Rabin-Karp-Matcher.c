//P993
RABINKARPMATCHER(T,P,d,q)
n=T.length
m=p.length
h=d^(m-1) mod q
p=0
t0=0
for i=1 to m{
	p=(dp+P[i]) mod q
	t0=(dt0+T[i]) mod q}
for s=0 to n-m
	if p==ts{
		if P[1..m]==T[s+1..s+m]
			print "Pattern occurs with shift" s
		if s<n-m
			ts+1=(d*(ts-T[s+1]*h)+T[s+m+1]) mod q}
		