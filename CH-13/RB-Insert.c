//P 315
RB-INSERT(T,z)
 y=T.nil
 x=T.root
 while x!=T.nil{
 	y=x
 	if z.key<x.key{
		x=x.left}
 	else{x=x.right}}
 z.p=y
 if y==T.nil{
 	T.root=z}
 elseif z.key<y.key{
 	y.left=z}
 else{y.right=z}
 z.left=T.nil
 z.right=T.nil
 z.color=RED
 RB-INSERT-FIXUP(T,z)
