//P601


struct graph{
	struct vertex *root;
    ArrType V;
	int max;
	ArrType Adj
};

struct vertex{
	char color;
	int d;
	int f;
	struct vertex *p;
	struct vertex *pi
};




void DFS(struct graph *G)
int i;
int v;
int time;
int u;
i=1;
while i<G.max{
G.V[i].color=WHITE;
//G.V[i].d=0;
G.V[i].p=NIL;
i=(i+1)};
/*for each vertex u belongsto G.V{
	u.color=WHITE
	u.pi=NIL}*/
time=0;
i=0;
while i<G.max{
//for each vertex u belongsto G.V{
	if G.V[i].color==WHITE
		DFSVISIT(&G,i);
		i=(i+1)};
return;
		
void DFSVISIT(struct graph *G, int i)
int time;
int v;
int u;
time=(time+1);  //white vertex u has just been discovered
G.V[i].d=time;
G.V[i].color=GRAY;
int t;
t=0;
while G.Adj[i][t]!=0 {
	v=0;
	while v<=(G.max-1){
		
		if G.V[v]==G.Adj[i][t]
		t=(t+1);
	//for each v belongsto G.Adj[u]
		if G.V[v].color==WHITE{
/*for each v belongsto G.Adi[u] { //explore edge(u,v)
	if v.color==WHITE{*/
		G.V[v].p=G.V[i];
	DFSVISIT(&G,v)};
		v=(v+1)}};
		
G.V[i].color=BLACK;   //blacken u; it is finished
		print(G.V[i]);
		
time=(time+1);
G.V[i].f=time;
return;


void PRINTPATH(struct graph *G,struct vertex *s, struct vertex *v)
if v==s
	print (s)
elseif v.pi==NIL
	print ("no path from s to v exists")//"no path from" s "to" v "exists"
else {PRINTPATH(&G,&s,&v.pi);
	print (v)};
	return;
	
	
main()
{
	struct graph *G;
	G.max=6;
struct vertex *V[G.max];
int A[G.max][G.max];
G.V=&V;
G.Adj=&A;
int i;
i=0;
while i<G.max{
	G.V[i]=i+1;
	//G.V[i].d=0;
	i=(i+1)
};
i=1;
while i<G.max-2{
	G.Adj[G.V[i]][0]=G.V[i+1];
	G.Adj[G.V[i]][1]=G.V[i-1];
	//G.V[i+1].p=G.V[i];
	i=(i+1)
};
G.V[0].p=G.V[G.max-1];
G.root=G.V[0];
	//G=createDG(&G);
	DFS(&G)
}


