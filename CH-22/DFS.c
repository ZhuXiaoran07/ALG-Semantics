//P 604
DFS(G)
for each vertex u belongsto G.V{
	u.color=WHITE
	u.pi=NIL}
time=0
for each vertex u belongsto G.V{
	if u.color==WHITE
		DFSVISIT(G,u)}
		
DFSVISIT(G,u)
time=time+1   //white vertex u has just been discovered
u.d=time
u.color=GRAY
for each v belongsto G.Adi[u] { //explore edge(u,v)
	if v.color==WHITE{
		v.pi=u
		DFSVISIT(G,v)}}
u.color=BLACK   //blacken u; it is finished
time=time+1
u.f=time