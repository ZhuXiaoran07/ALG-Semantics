//P 394
LCS-LENGTH(X,Y)
m=X.length
n=Y.length
let b[1..m,1..n] and c[0..m,0..n] be new tables
for i=1 to m{
	c[i,0]=0}
for j=0 to n{
	c[0,j]=0}
for i=1 to m{
	for j=1 to n{
		if xi==yi{
			c[i,j]=c[i-1,j-1]+1
b[i,j]=}}}
