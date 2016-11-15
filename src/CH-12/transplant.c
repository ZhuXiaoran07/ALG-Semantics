//P 296
TRANSPLANT(T,u,v)
1 if u.p==NIL{
2 	T.root=v}
3 elseif u==u.p.left{
4 	u.p.left=v}
5 else{u.p.right=v}
6 if v!=NIL{
7 	v.p=u.p}