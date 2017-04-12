//P1109
APPROXVERTEXCOVER(G)
C=EMPTY
E'=G.E
while E'!=EMPTY{
	let (u,v) be an arbitrary edge of E'
	C=C SUNION {u,v}
	remove from E' every edge incident on either u or v}
return C