//P371
MATRIXMULTIPLY(A,B)
if A.columns!=B.rows
error "incompatible dimensions"
else {let C be a new A.rows * B.columns matrix
	for i=1 to A.rows
		for j=1 to B.columns{
			c[i][j]=0
			for k=1 to A.columns
			c[i][j]=c[i][j]+a[i][k]*b[k][j]}
	return C}