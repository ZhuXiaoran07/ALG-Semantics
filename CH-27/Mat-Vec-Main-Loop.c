//P786
MATVECMAINLOOP(A,x,y,n,i,i')
if i==i'
	for j=1 to n{
		y[i]=y[i]+a[i][j]*x[i]}
else{mid=(i+i')/2
	 spawn MATVECMAINLOOP(A,x,y,n,i,mid)
	 MATVECMAINLOOP(A,x,y,n,mid+1,i')
	 sync}