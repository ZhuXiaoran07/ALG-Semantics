//P 388
MEMORIZEDMATRIXCHAIN(p)
n=p.length-1
let m[1..n,1..n] be a new table
for i=1 to n{
	for j=i to n{
		m[i,j]=INFINITY}}
return LOOKUPCHAIN(m,p,1,n)