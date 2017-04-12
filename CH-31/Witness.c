//P969
WITNESS(a,n)
//let t and u be such that t>=1, u is odd, and n-1=2^t *u    //change
x0=MODULAREXPONENTIATION(a,u,n)
for i=1 to t{
	xi=xi-1^2 mod n
	if xi==1 and xi-1!=1 and xi-1!=n-1
		return TRUE}
if xt!=1^2	
	return TRUE
return FALSE

MILLERRABIN(n,s)
for j=1 to s{
	a=RANDOM(1,n-1)
	if WITNESS(a,n)
    return COMPOSITE}
return PRIME