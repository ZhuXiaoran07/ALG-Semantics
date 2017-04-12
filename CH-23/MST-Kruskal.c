//P631
MSTKRUSKAL(G,w)
A=EMPTY
for each vertex v belongsto G.V
	MAKESET(v)
sort the edges of G.E into nondecreasing order 
for each edge (u,v) belongsto G.E taken in nondecreasing order by weight
	if FINDSET(u)!=FINDSET(v){
		A=A SUNION {(u,v)}
		UNION(u,v)}
return A