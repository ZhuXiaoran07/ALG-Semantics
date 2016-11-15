//P323
RB-TRANSPLANT(T,u,v)
1 if u.p==T.nil{
2		T.root=v}
3 elseif u==u.p.left{
4 		u.p.left=v}
5 else{u.p.right=v}
6 v.p=u.p