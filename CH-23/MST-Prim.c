//P634
MSTPRIM(G,w,r)
for each u belongsto G.V{
	u.key=INFINITY
	u.pi=NIL}
r.key=0
Q=G.V
while Q!=EMPTY{
	u=EXTRACTMIN(Q)
	for each v belongsto G.Adj[u]{
		if V belongsto Q and w(u,v)<v.key{
			v.pi=u
v.key=w(u,v)}}}