//P751
DISCHARGE(u)
while u.e>0{
	v=u.current
	if v==NIL{
		RELABLE(u)
		u.current=u.N.head}
	elseif cf(u,v)>0 and u.h==v.h+1
	PUSH(u,v)
else u.current=v.next-neighbor}