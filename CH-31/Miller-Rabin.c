//P970
MILLER-RABIN(n,s)
for j=1 to s{
	a=RANDOM(1, n-1)
	if WITNESS(a,n)
		return COMPOSITE}
return PRIME
	