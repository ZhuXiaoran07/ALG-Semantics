//P790
MATVECWRONG(A,x)
n=A.rows
let y be a new vector of length n
parallel for i=1 to n
	y[i]=0
parallel for i=1 to n
	parallel for j=1 to n
	y[i]=y[i]+a[i][j]*x[j]
return y