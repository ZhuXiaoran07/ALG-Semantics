//P 351
INTERVAL-SEARCH(T,i)
1 x=T.root
2 while x!=T.nil and i does not overlap x.int{
3 	if x.left!=T.nil and x.left.max>=i.low{
4 		x=x.left}
5 	else{x=x.right}}
6 return x