//P292
TREE-SUCCESSOR(x)
1 if x.right!=NIL{
2 	return TREE-MINIMUM(x.right)}
3 y=x.p
4 while y!=NIL and x==y.right{
5 	x=y
6 	y=y.p}
7 return y