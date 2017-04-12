//P 385
RECURSIVEMATRIXCHAIN(p,i,j)
if i==j
	return 0
m[i,j]=INFINITY
for k=i to j-1{
	q=RECURSIVEMATRIXCHAIN(p,i,k)
	  + RECURSIVEMATRIXCHAIN(p,k+1,j)
	  + p[i-1]*p[k]*p[j] // made some changes
	 if q<m[i,j]
		m[i,j]=q}
return m[i,j]
	  