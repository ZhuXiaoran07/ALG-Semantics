//P375
MATRIXCHAINORDER(p)
n=p.length-1
let m[1..n,1..n] and s[1..n-1,2..n] be new tables
for i=1 to n
m[i,i]=0
for l=2 to n		//l is the chain length
	for i=1 to n-l+1{
		j=i+l-1
		m[i,j]=INFINITY
		for k=i to j-1{
			q=m[i,k]+m[k+1,j]+p[i-1]*p[k]*p[j] //made some change
			if q<m[i,j]
				m[i,j]=q
				s[i,j]=k}}
return m and s