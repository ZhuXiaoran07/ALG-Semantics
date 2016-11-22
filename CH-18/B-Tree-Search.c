//P492
B-TREE-SEARCH(x,k)
i=1
while i<=x.n and k>x.keyi{
	i=i+1}
if i<=x.n and k==x.keyi
	return(x,i)
elseif x.leaf==TRUE  //made changes
	return NIL
else {DISK-READ(x.ci)
	  return B-TREE-SEARCH(x.ci,k)}