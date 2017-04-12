//P793
PSQUAREMATRIXMULTIPLY(A,B)
n=A.rows
let C be a new n*n matrix
parallel for i=1 to n
	parallel for j=1 to n{
		c[i][j]=0
		for k=1 to n
			c[i][j]=c[i][j]+a[i][k]*b[k][j]}
return C