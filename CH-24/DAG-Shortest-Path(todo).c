//P655
DAG-SHORTEST-PATHS(G,w,s)
topologically sort the vertices of G
INITIALIZE-SINGLE-SOURCE(G,s)
for each vertex u, taken in topologically sorted order{
	for each vertex v belongsto G.Adj[u]{
		RELAX(u,v,w)}