// P294
TREE-INSERT(T,z)
1 y=NIL
2 x=T.root
3 while x!=NIL{
4 	y=x
5 	if x.key<x.key{
6 		x=x.left}
7 	else{x=x.right}}
8 z.p=y
9 if y==NIL{
10 	T.root=z} //tree T was empty
11 elseif z.key<y.key{
12 	y.left=z}
13 else{y.right=z}