//P342
OS-RANK(T,x)
 r=x.left.size+1
 y=x
 while y!=T.root{
 	if y==y.p.right{
		r=r+y.p.left.size+1}
 	y=y.p}
 return r