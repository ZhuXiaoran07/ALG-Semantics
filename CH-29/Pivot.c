//P869
PIVOT(N,B,A,b,c,v,l,e)
//Compute the coefficients of the equation for new basic variable xe
let A' be a new m*n matrix
b'[e]=b[l]/a[l][e]
for each j belongsto N-{e}
	a'[e][j]=a[l][j]/a[l][e]
a'[e][l]=1/a[l][e]
//Compute the coefficients of the remaining constraints
for each i belongsto B-{l}{
	b'[i]=b[i]-a[i][e]*b'[e]
	for each j belongsto N-{e}
		a'[i][j]=a[i][j]-a[i][e]*a'[e][j]
a'[i][l]=0-a[i][e]*a'[e][l]}
v'=v+c[e]*b'[e]
for each j belongsto N-{e}
	c'[j]=c[j]-c[e]*a'[e][j]
c'[l]=0-c[e]*a'[e][l]
N'=N-{e} SUNION {l}
B'=B-{l} SUNION {e}
return(N',B',A',b',c',v')