//P563
CONNECTED-COMPONENTS(G)
for each vertex v belongsto G.V{
	MAKE-SET(v)}
for each edge (y,v) belongsto G.E{
	if FIND-SET(u)!=FIND-SET(v)
	UNION(u,v)}
	
SAME-COMPONENT(u,v)
if FIND-SET(u)==FIND-SET(v)
	return TRUE
else return FALSE