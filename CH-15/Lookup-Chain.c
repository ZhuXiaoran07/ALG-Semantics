//P388

LOOKUP-CHAIN(m,p,i,j)
if m[i,j]<INFINITY
return m[i,j]
if i==j
m[i,j]=0
else{for k=i to j-1{
	q=LOOKUP-CHAIN(m,p,i,k)+LOOKUP-CHAIN(m,p,k+1,j)+p //made some change 
	  if q<m[i,j]
m[i,j]=q}}
return m[i,j]