//P 296
TRANSPLANT(T,u,v)
 if u.p==NIL{
 	T.root=v}
 elseif u==u.p.left{
 	u.p.left=v}
 else{u.p.right=v}
 if v!=NIL{
 	v.p=u.p}