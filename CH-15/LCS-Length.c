//P 394
LCSLENGTH(X,Y)
m=X.length
n=Y.length
let b[1..m,1..n] and c[0..m,0..n] be new tables
for i=1 to m
	c[i,0]=0
for j=0 to n
	c[0,j]=0
for i=1 to m
	for j=1 to n
		if x[i]==y[i]{
			c[i,j]=c[i-1,j-1]+1
			b[i,j]=LEFT}
		elseif c[i-1,j]>=c[u,j-1]{
			c[i,j]=c[i-1,j]
		    b[i,j]=UP}
		else {c[i,j]=c[i,j-1]
			  b[i,j]=RIGHT}
return c and b
