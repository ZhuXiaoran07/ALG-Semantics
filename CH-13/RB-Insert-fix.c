//p316
RB-INSERT-FIXUP(T,z)
 while z.p.color==RED{
	if z.p==z.p.p.left{
		y=z.p.p.right
		if y.color==RED{
			z.p.color==BLACK
			y.color=BLACK
			z.p.p.color=BLACK
			z=z.p.p}
		elseif z==z.p.right{
			z=z.p
			LEFT-ROTATE(T,z)
 			z.p.color=BLACK
			z.p.p.color=RED
			RIGHT-ROTATE(T,z.p.p)}
    else{same as then clause with "right" and "left" exchanged}}}
 T.root.color=BLACK 
