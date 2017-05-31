//P563
struct graph{
	struct vertex* V;
	struct edge* E
};

struct vertex{
	int rank;
	struct vertex* p
};



void CONNECTEDCOMPONENTS(struct graph* G)
struct vertex* v;
v=G.V;

//for each vertex v belongsto G.V
	MAKESET(&v);
struct vertex* y;
//for each edge (y,v) belongsto G.E
	if FINDSET(&u)!=FINDSET(&v)
	UNION(&u,&v);
	return;
	
int SAMECOMPONENT(struct vertex* u, struct vertex* v)
if FINDSET(&u)==FINDSET(&v)
	return (TRUE)
else return (FALSE)

void MAKESET(struct vertex* x)
x.p=&x;
x.rank=0;
return;

void UNION(struct vertex* x, struct vertex* y)
LINK(FINDSET(&x), FINDSET(&y));
return;

void LINK(struct vertex* x,struct vertex* y)
if x.rank>y.rank
	y.p=x
else{ x.p=y;
	if x.rank==y.rank
		y.rank=(y.rank+1)};
return;
		
int FINDSET(struct vertex* x)
if x!=x.p
	x.p=FINDSET(&x.p);
return (x.p)

main()
{
	struct graph* G;
	struct vertex* x;
	MAKESET(&x);
	CONNECTEDCOMPONENTS(&G)
}