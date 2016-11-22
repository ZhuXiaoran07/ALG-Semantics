//P649
RELAX(u,v,w)
if v.d>u.d + w(u,v){
	v.d=u.d+w(u,v)
	v.pi=u}