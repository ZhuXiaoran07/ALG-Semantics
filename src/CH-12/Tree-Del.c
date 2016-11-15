//p298
TREE-DELETE(T,z)
1 if z.left==NIL{
2	TRANSPLANT(T,z,z.right)}
3 elseif z.right==NIL{
4 	TRANSPLANT(T,z,z.left)}
5 else {y=TREE-MINIMUM(z.right)}
6 if y.p!=z{
7 	TRANSPLANT(T,y,y.right)
8 	y.right=z.right
9	y.right.p=y}
10 TRANSPLANT(T,z,y)
11 y.left=z.left
12 y.left.p=y