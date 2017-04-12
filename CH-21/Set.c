//P571
MAKESET(x)
x.p=x
x.rank=0

UNION(x,y)
LINK(FINDSET(x), FINDSET(y))

LINK(x,y)
if x.rank>y.rank
	y.p=x
else{ x.p=y
	if x.rank==y.rank
		y.rank=y.rank+1}
		
FINDSET(x)
if x!=x.p
	x.p=FINDSET(x.p)
return x.p