//P324
RB-DELETE(T,z)
1 y=z
2 y-original-color=y.color
3 if z.left==T.nil{
4 	x=z.right
5 	RB-TRANSPLANT(T,z,z.right)}
6 elseif z.right==T.nil{
7	x=z.left
8	RB-TRANSPLANT(T,z,z.left)}
9 else{y=TREE-MINIMUM(z.right)
10 	y-original-color=y.color
11 	x=y.right
12 	if y.p==z{
13 		x.p=y}
14 	else{RB-TRANSPLANT(T,y,y.right)
15 		y.right=z.right
16 		y.right.p=y}
17 	RB-TRANSPLANT(T,z,y)
18 	y.left=z.left
19 	y.left.p=y
20 	y.color=z.color}
21	if y-original-color==BLACK{
22 		RB-DELETE-FIXUP(T,x)}