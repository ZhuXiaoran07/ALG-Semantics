//P 315
RB-INSERT(T,z)
1 y=T.nil
2 x=T.root
3 while x!=T.nil{
4 	y=x
5 	if z.key<x.key{
6		x=x.left}
7 	else{x=x.right}}
8 z.p=y
9 if y==T.nil{
10 	T.root=z}
11 elseif z.key<y.key{
12 	y.left=z}
13 else{y.right=z}
14 z.left=T.nil
15 z.right=T.nil
16 z.color=RED
17 RB-INSERT-FIXUP(T,z)
