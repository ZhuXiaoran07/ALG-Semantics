//P658
DIJKSTRA(G,w,s)
INITIALIZE-SINGLE-SOURCE(G,s)
S=EMPTY
Q=G.V
while Q!=EMPTY{
	u=EXTRACT-MIN(Q)
	for each vertex v belongsto G.Adj[u]{
		RELAX(u,v,w)}}