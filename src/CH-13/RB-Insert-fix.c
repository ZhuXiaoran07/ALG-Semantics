//p316
RB-INSERT-FIXUP(T,z)
1 while z.p.color==RED{
2	if z.p==z.p.p.left{
3		y=z.p.p.right
4		if y.color==RED{
5			z.p.color==BLACK
6			y.color=BLACK
7			z.p.p.color=BLACK
8			z=z.p.p}
9		elseif z==z.p.right{
10			z=z.p
11			LEFT-ROTATE(T,z)
12 			z.p.color=BLACK
13			z.p.p.color=RED
14			RIGHT-ROTATE(T,z.p.p)}
15    else{same as then clause with "right" and "left" exchanged}}}
16 T.root.color=BLACK 
