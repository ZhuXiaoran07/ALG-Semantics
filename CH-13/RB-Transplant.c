//P323
RB-TRANSPLANT(T,u,v)
 if u.p==T.nil{
		T.root=v}
 elseif u==u.p.left{
 		u.p.left=v}
 else{u.p.right=v}
 v.p=u.p