//P 385
RECURSIVE-MATRIX-CHAIN(p,i,j)
if i==j
	return 0
m[i,j]=INFINITY
for k=i to j-1{
	q=RECURSIVE-MATRIX-CHAIN(p,i,k)
	  + RECURSIVE-MATRIX-CHAIN(p,k+1,j)
	  + pi // made some changes
	 if q<m[i,j]
		m[i,j]=q}
return m[i,j]
	  