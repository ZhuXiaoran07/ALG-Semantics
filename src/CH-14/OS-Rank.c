//P342
OS-RANK(T,x)
1 r=x.left.size+1
2 y=x
3 while y!=T.root{
4 	if y==y.p.right{
5 		r=r+y.p.left.size+1}
6 	y=y.p}
7 return r