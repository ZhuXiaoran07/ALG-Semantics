//P739
PUSH(u,v)
DELTA[f](u,v)=min(u.e,c[f](u,v))
if(u,v) belongsto E
	(u,v).f=(u,v).f+DELTA[f](u,v)
else (v,u).f=(v,u).f-DELTA[f](u,v)
u.e=u.e-DELTA[f](u,v)
v.e=v.e+DELTA[f](u,v)