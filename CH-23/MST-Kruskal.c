//P631
MST-KRUSKAL(G,w)
A=EMPTY
for each vertex v belongsto G.V{
	MAKE-SET(v)}
sort the edges of G.E into nondecreasing order 
for each edge (u,v) belongsto G.E taken in nondecreasing order by weight{
	if FIND-SET(u)!=FIND-SET(v){
		A=A+{(u,v)}
		UNION(u,v)}}
return A