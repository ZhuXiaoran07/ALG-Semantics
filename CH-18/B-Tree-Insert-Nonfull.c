//P496
BTREEINSERTNONFULL(x,k)
i=x.n
if x.leaf==TRUE{
	while i>=1 and k<x.key{
		x.key[i+1]=x.key[i]
		i=i-1}
	x.key[i+1]=k
	x.n=x.n+1
	DISKWRITE(x)}
	
else {while i>=1 and k<x.key[i]
		i=i-1
	i=i+1
	DISK-READ(x,c[i])
	if x.c[i].n==2*t-1{
		BTREESPLITCHILD(x,i)
		if k>x.key[i]
			i=i+1}
	BTREEINSERTNONFULL(x.c[i],k)}