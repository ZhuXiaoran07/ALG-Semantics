// P291
ITERATIVE-TREE-SEARCH(x,k)
 while x!=NIL and k!=x.key{
	if k<x.key{
		x=x.left}
	else{x=x.right}}
 return x