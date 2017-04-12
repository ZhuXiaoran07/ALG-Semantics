//P563
CONNECTEDCOMPONENTS(G)
for each vertex v belongsto G.V
	MAKESET(v)
for each edge (y,v) belongsto G.E
	if FINDSET(u)!=FINDSET(v)
	UNION(u,v)
	
SAMECOMPONENT(u,v)
if FINDSET(u)==FINDSET(v)
	return TRUE
else return FALSE