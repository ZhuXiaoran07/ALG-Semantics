//P824
LUPDECOMPOSITION(A)
n=A.rows
let pi[1..n] be a new array
for i=1 to n
	pi[i]=i
for k=1 to n{
	p=0
	for i=k to n
		if |a[i][k]|>p{
			p=|a[i][k]|
            k'=i }
	if p==0
		error "singular matrix"
	exchange pi[k] with pi[k']
	for i=1 to n{
		exchange a[k][i] with a[k'][i]}
	for i=k+1 to n{
		a[i][k]=a[i][k]/a[k][k]
		for j=k+1 to n{
a[i][j]=a[i][j]-a[i][k]*a[k][j]}}}