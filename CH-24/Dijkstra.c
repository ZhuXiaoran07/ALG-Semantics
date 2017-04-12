//P658
DIJKSTRA(G,w,s)
INITIALIZESINGLESOURCE(G,s)
S=EMPTY
Q=G.V
while Q!=EMPTY{
	u=EXTRACTMIN(Q)
	for each vertex v belongsto G.Adj[u]
		RELAX(u,v,w)}