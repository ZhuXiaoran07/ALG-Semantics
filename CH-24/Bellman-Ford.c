//P651
BELLMAN-FORD(G,w,s)
INITIALIZE-SINGLE-SOURCE(G,s)
for i=1 to |G.V|-1{
	for each edge(u,v) belongsto G.E{
		RELAX(u,v,w)}}
for each edge(u,v) belongsto G.E{
	if v.d >u.d //+w(u,v)
		return FALSE}
return TRUE