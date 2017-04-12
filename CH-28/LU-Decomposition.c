//P821
LUDECOMPOSITION(A)
n=A.rows
let L and U be new n*n matrices
initialize U with 0s below the diagonal
initialize L with 1s on the diagonal and 0s above the diagonal
for k=1 to n{
	u[k][k]=a[k][k]
	for i=k+1 to n{
		l[i][k]=a[i][k]/u[k][k]
		u[k][i]=a[k][i]}
	for i=k+1 to n{
		for j=k+1 to n{
			a[i][j]=a[i][j]-l[i][k]*u[k][j]}}}
return L and U