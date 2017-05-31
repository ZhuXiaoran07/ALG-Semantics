//P595

struct graph{
	struct vertex *root;
    ArrType V;
	int max;
	ArrType Adj
};

struct vertex{
	char color;
	int d;
	struct vertex *p
};

struct Queue{
	int tail;
	int head;
	int leng;
	ArrType data
	
};

/*int createDG(struct graph G)
G.max=6;
struct vertex V[G.max];
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
i=0;
while i<G.max-2{
	G.Adj[G.V[i+1]][0]=G.V[i];
	i=(i+1)
};
G.Adj[0][0]=G.V[G.max-1];
G.root=G.V[0];
return (G)*/


int ENQUEUE(struct Queue *Q, int x)
//Q.tail=0;
 Q.data[Q.tail]=x;
 if Q.tail==Q.leng
 	Q.tail=1
 else Q.tail=(Q.tail+1);
 return (&Q)

int DEQUEUE(struct Queue *Q)
//Q.head=0;
int x;
 x=Q.data[Q.head];
 if Q.head==Q.leng
 	Q.head=1
 else Q.head=(Q.head+1);
 return (x)
 

void BFS(struct graph *G)
struct graph *G1;
//for each vertex u belongsto G.V-{s} {
int i;
int v;
int u;
i=1;
 struct Queue *Q;
	 Q.tail=0;
	 Q.head=0;
	 Q.leng=7;
	 int data[Q.leng];
	 Q.data=&data;
while i<G.max{
G.V[i].color=WHITE;
G.V[i].d=0;
G.V[i].p=NIL;
i=(i+1)};
G.V[0].color=GRAY;
G.V[0].d=0;
G.V[0].p=NIL;
Q=ENQUEUE(&Q,G.V[0]);
while Q!=NIL{
	G.V[u]=DEQUEUE(&Q);
	i=0;
	while G.Adj[u][i]!=0{
		G.V[v]=G.Adj[u][i];
		i=(i+1);
	//for each v belongsto G.Adj[u]
		if G.V[v].color==WHITE{
			G.V[v].color=GRAY;
			G.V[v].d=(G.V[u].d+1);
			G.V[v].p=G.V[u];
			Q=ENQUEUE(&Q,v)};
	G.V[v].color=BLACK;
	print(G.V[v]);
	v=(v+1)
}};
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
i=0;
while i<G.max-2{
	G.Adj[G.V[i+1]][0]=G.V[i];
	i=(i+1)
};
G.Adj[0][0]=G.V[G.max-1];
G.root=G.V[0];
	//G=createDG(&G);
	BFS(&G)
}