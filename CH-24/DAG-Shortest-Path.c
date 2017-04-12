//P655
DAGSHORTESTPATHS(G,w,s)
topologically sort the vertices of G
INITIALIZESINGLESOURCE(G,s)
for each vertex u, taken in topologically sorted order
	for each vertex v belongsto G.Adj[u]
		RELAX(u,v,w)