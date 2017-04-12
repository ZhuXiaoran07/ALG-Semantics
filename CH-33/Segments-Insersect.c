//P1018
SEGMENTSINSERSECT(p1,p2,p3,p4)
d1=DIRECTION(p3,p4,p1)
d2=DIRECTION(p3,p4,p2)
d3=DIRECTION(p1,p2,p4)
d4=DIRECTION(p1,p2,p4)
if ((d1>0 and d2<0) or (d1<0 and d2>0)) and
	((d3>0 and d4<0) or (d3<0 and d4>0))
	return TRUE
elseif d1==0 and ONSEGMENT(p3,p4,p1)
	return TRUE
elseif d2==0 and ONSEGMENT(p3,p4,p2)
	return TRUE
elseif d3==0 and ONSEGMENT(p1,p2,p3)
	return TRUE
elseif d4==0 and ONSEGMENT(p1,p2,p4)
	return TRUE
else return FALSE

DIRECTION(pi,pj,pk)
	return (pk-pi)*(pj-pi)


ON-SEGMENT(pi,pj,pk)
if min(xi,xj)<=xk<=max(xi,xj) and min(yi,yj)<=yk<=max(yi,yj)
	return TRUE
else return FALSE