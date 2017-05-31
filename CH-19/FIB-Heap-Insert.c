//P510

struct FibHeap{
	int n;
	struct FibHeapNode* min
};

struct FibHeapNode{
	int degree;
	struct FibHeapNode* p;
	struct FibHeapNode* child;
	struct FibHeapNode* right;
	struct FibHeapNode* left;
	int key;
	bool mark
};


void FIBHEAPDELETE(struct FibHeap* H, struct FibHeapNode* x)
FIBHEAPDECREASEKEY(&H,&x,-1);
FIBHEAPEXTRACTMIN(&H);
return;


void FIBNODEADD(struct FibHeapNode* n, struct FibHeap* H)
n.left=H.min.root;
H.min.left.right=n;
n.right=H.min;
H.min.left=n;
return;


/*CONSOLIDATE(struct FibHeap* H)
int A[H.min.degree];
int i;
i=0;
while (i<=H.min.degree){
	A[i]=0;
	i=i+1
};
//let A[0..D(H.n)] be a new array
//for i=0 to D(H.n)
//	A[i]=NIL
//	while 
for each node w in the root list of H{
	x=w
	d=x.degree
	while A[d]!=NIL{
		y=A[d]		//another node with the same degree as x
		if x.key>y.key
			exchange x with y
		FIBHEAPLINK(H,y,x)
		A[d]=x
		d=d+1}
	A[d]=x}
H.min=NIL
for i=0 to D(H.n)
	if A[i]!=NIL
		if H.min==NIL{
			create a root list for H containing just A[i]
			H.min=A[i]}
		else{insert A[i] into H's root list
			if A[i].key<H.min.key
				H.min=A[i]}
				
FIB-HEAP-LINK(H,y,x)
remove y from the root list of H
make y a child of x, incrementing x.degree
y.mark=FALSE*/

int FIBHEAPEXTRACTMIN(struct FibHeap* H)
struct FibHeapNode* z;
z=H.min;
if z!=NIL{
	while z.child!=NIL{
		FIBNODEADD(&z.child, &H);
		z.child.p=NIL
		};
	/*for each child x of z{
		add x to the root list of H
		x.p=NIL}*/
	//remove z from the root list of H
	if z==z.right
		H.min=NIL
	else H.min=z.right;
		//CONSOLIDATE(H)
    H.n=(H.n-1)};
return (z)

void FIBHEAPINSERT(struct FibHeap* H, struct FibHeapNode* x)

x.degree=0;
x.p=NIL;
x.child=NIL;
x.mark=FALSE;
if H.min==NIL
	//create a root list for H containing just x
H.min=x
else{//insert x into H's root list
	if x.key<H.min.key{
		H.min=x;
	x.child=H.min.child}
	else {struct FibHeapNode* z;
	     z=H.min;
		 if z.child==NIL
		     z.child=x
}};
H.n=(H.n+1);
return;

main(){
	struct FibHeap* H;
	struct FibHeapNode* x;
	x.key=2;
	FIBHEAPINSERT(&H, &x)
}
		