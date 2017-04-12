//P626
GENERICMST(G,w)
A=EMPTY
while A does not form a spanning tree{
	find an edge (u,v) that is safe for A
	A=A SUNION {(u,v)}}
return A