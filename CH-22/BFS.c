//P595
BFS(G,s)
for each vertex u belongsto G.V-{s} {
	u.color=WHITE
	u.d=INFINITY
	u.pi=NIL}
s.color=GRAY
s.d=0
s.pi=NIL
Q=EMPTY
ENQUEUE(Q,s)
while Q!=EMPTY{
	u=DEQUEUE(Q)
	for each v belongsto G.Adj[u]
		if v.color==WHITE{
			v.color=GRAY
			v.d=u.d+1
			v.pi=u
			ENQUEUE(Q,v)}
	u.color=BLACK
}