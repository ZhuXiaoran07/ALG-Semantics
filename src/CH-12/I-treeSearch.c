// P291
ITERATIVE-TREE-SEARCH(x,k)
1 while x!=NIL and k!=x.key{
2	if k<x.key{
3		x=x.left}
4	else{x=x.right}}
5 return x