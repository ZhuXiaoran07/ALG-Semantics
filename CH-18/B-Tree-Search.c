//P492
BTREESEARCH(x,k)
i=1
while i<=x.n and k>x.key[i]
	i=i+1
if i<=x.n and k==x.key[i]
	return(x,i)
elseif x.leaf==TRUE  //made changes
	return NIL
else {DISKREAD(x.c[i])
	  return BTREESEARCH(x.c[i],k)}