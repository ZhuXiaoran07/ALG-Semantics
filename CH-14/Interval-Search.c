//P 351
INTERVAL-SEARCH(T,i)
 x=T.root
 while x!=T.nil and i does not overlap x.int{
 	if x.left!=T.nil and x.left.max>=i.low
		x=x.left
 	else x=x.right}
 return x