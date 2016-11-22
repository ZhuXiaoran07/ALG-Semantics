//P519
FIB-HEAP-DECREASE-KEY(H,x,k)
if k>x.key{
	error"new key is greater than current key"}
x.key=k
y=x.p
if y!=NIL and x.key<y.key{
	CUT(H,x,y)
	CACADING-CUT(H,y)}
if x.key<H.min.key
	H.min=x
	
/*CUT(H,x,y)
remove x from the child list of y, decrementing y.degree
add x to the list of H
x.p=NIl
x.mark=FALSE*/

CASCADING-CUT(H,y)
z=y.p
if z!=NIL
	if y.mark==FALSE
		y.mark=TRUE
	else{CUT(H,y,z)
		CACADING-CUT(H,z)}