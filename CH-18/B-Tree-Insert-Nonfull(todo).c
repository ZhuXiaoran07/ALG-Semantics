//P496
B-TREE-INSERT-NONFULL(x,k)
i=x.n
if x.leaf==TRUE{
	while i>=1 and k<x.key{
		x.keyi+1=x.keyi
		i=i-1}
	x.keyi+1=k
	x.n=x.n+1
	DISK-WRITE(x)}
else{while i>=1 and k<x.keyi{
		i=i-1}
	i=i+1
	DISK-READ(x,ci)
	if x.ci.n==2*t-1{
		B-TREE-SPLIT-CHILD(x,i)
		if k>x.keyi{
			i=i+1}}
	B-TREE-INSERT-NONFULL(x.ci,k)}