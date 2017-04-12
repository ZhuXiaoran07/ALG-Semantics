//P817
LUPSOLVE(L,U,pi,b)
n=L.rows
let x be a new vector of length n
for i=1 to n
	y[i] =b[pi[i]]-SIGMA(i-1)(j=1)(l[i][j]*y[j])
for i=n downto 1
	x[i]=(y[i]-SIGMA(n)(j=i+1)(u[i][j]*x[j]))/u[i][i]