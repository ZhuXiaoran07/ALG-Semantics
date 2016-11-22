//P571
MAKE-SET(x)
x.p=x
x.rank=0

UNION(x,y)
LINK(FIND-SET(x), FIND-SET(y))

LINK(x,y)
if x.rank>y.rank
	y.p=x
else{ x.p=y
	if x.rank==y.rank
		y.rank=y.rank+1}
		
FIND-SET(x)
if x!=x.p
	x.p=FIND-SET(x.p)
return x.p