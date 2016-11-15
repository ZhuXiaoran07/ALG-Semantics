// P290
TREE-SEARCH(x,k)
1 if x==NIL or k==x.key{
2 	return x}
3 if k<x.key{
4 	return TREE-SEARCH(x.left,k)}
5 else{return TREE-SEARCH(x.right,k)}