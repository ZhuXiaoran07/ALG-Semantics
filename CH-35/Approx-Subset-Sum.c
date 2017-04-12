//P1131
APPROXSUBSETSUM(S,t,m) //change
n=|S|
L0=<0>
for i=1 to n{
	Li=MERGELISTS(Li-1, Li-1 + xi)
	Li=TRIM(Li, m/2*n)
	remove from Li every element that is greater than t
	}
let z* be the largest value in Ln
return z*