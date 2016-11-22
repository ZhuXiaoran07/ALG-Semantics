// P294
TREE-INSERT(T,z)
 y=NIL
 x=T.root
 while x!=NIL{
 	y=x
 	if x.key<x.key{
 		x=x.left}
 	else{x=x.right}}
 z.p=y
 if y==NIL{
 	T.root=z} //tree T was empty
 elseif z.key<y.key{
 	y.left=z}
 else{y.right=z}