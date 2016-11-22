//p298
TREE-DELETE(T,z)
 if z.left==NIL{
	TRANSPLANT(T,z,z.right)}
 elseif z.right==NIL{
 	TRANSPLANT(T,z,z.left)}
 else {y=TREE-MINIMUM(z.right)}
 if y.p!=z{
 	TRANSPLANT(T,y,y.right)
 	y.right=z.right
	y.right.p=y}
 TRANSPLANT(T,z,y)
 y.left=z.left
 y.left.p=y