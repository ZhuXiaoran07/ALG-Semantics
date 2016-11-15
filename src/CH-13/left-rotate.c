//p313
LEFT-RPTATE(T,x)
1 y=x.right  //set y
2 x.right=y.left  //turn y's left subtree into x's right subtree
3 if y.left!=T.nil{
4 	y.left.p=x}
5 y.p=x.p   //link x's parent to y
6 if x.p==T.nil{
7 	T.root=y}
8 elseif x==x.p.left{
9 	x.p.left=y}
10 else{x.p.left=y}
11 y.left=x  //put x on y's left
12 x.p=y