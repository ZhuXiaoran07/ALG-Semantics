//P512
//P519
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


void FIBHEAPDECREASEKEY(struct FibHeap* H, struct FibHeapNode* x,int k)
struct FibHeapNode* y;
if k>x.key{
	print ("new key is greater than current key");
	return;};
x.key=k;
y=&x.p;
if y!=NIL and x.key<y.key{
	CUT(&H,&x,y);
	CACADINGCUT(&H,y)};
	y=&H.min;
if x.key<y.key
	H.min=x;
return;
	
void CUT(struct FibHeap* H,struct FibHeapNode* x, struct FibHeapNode* y)
//remove x from the child list of y
//y.child=NIL;
y.degree=(y.degree-1);
//decrementing y.degree
FIBHEAPINSERT(&H, &x);
//add x to the list of H
x.p=NIl;
x.mark=FALSE;
return;

void CASCADINGCUT(struct FibHeap* H, struct FibHeapNode* y)
struct FibHeapNode* z;
z=&y.p;
if z!=NIL
	if y.mark==FALSE
		y.mark=TRUE
	else{CUT(&H,&y,&z);
		CACADINGCUT(&H,&z)};
return;
		
void FIBHEAPDELETE(struct FibHeap* H, struct FibHeapNode* x)
FIBHEAPDECREASEKEY(&H,&x,-1);
FIBHEAPEXTRACTMIN(&H);
return;

int FIBHEAPEXTRACTMIN(struct FibHeap* H)
struct FibHeapNode* z;
z=H.min;
if z!=NIL{
/*	for each child x of z{
		add x to the root list of H
		x.p=NIL}
	remove z from the root list of H*/
	z.child=NIL;
	if z==z.right
		H.min=NIL
	else H.min=z.right;
		//CONSOLIDATE(H)
    H.n=(H.n-1)};
//return (z)
return;

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


void CONSOLIDATE(struct FibHeap* H)
//int A[D(H.n)+1];
int A[H.min.degree+1];
int i;
while i<=(H.min.degree+1){
//let A[0..D(H.n)] be a new array
//for i=0 to D(H.n)
	A[i]=NIL;
i=i+1};
//for each node w in the root list of H{
if H.min!=NIL	
	x=w;
	d=x.degree;
	while A[d]!=NIL{
		y=A[d]	;	//another node with the same degree as x
		if x.key>y.key
			//exchange x with y
		FIBHEAPLINK(H,y,x);
		A[d]=x;
		d=d+1};
	A[d]=x;
H.min=NIL;
//for i=0 to D(H.n)
	if A[i]!=NIL
		if H.min==NIL{
			//create a root list for H containing just A[i]
			H.min=A[i]}
		/*else{//insert A[i] into H's root list
			if A[i].key<H.min.key
				H.min=A[i]}*/
				
/*FIB-HEAP-LINK(H,y,x)
remove y from the root list of H
make y a child of x, incrementing x.degree
y.mark=FALSE*/



int FIBHEAPUNION(struct FibHeap* H1, struct FibHeap* H2)
//H=MAKEFIBHEAP()
struct FibHeap H;
H.min=H1.min;
//concatenate the root list of H2 with the root list of H
if (H1.min==NIL) or (H2.min!=NIL and H2.min.key<H1.min.key)
	H.min=H2.min;
H.n=(H1.n+H2.n);
return (H)


main(){
	struct FibHeap* H;
	H.n=0;
	struct FibHeapNode* x;
	x.key=2;
	FIBHEAPINSERT(&H, &x);
	FIBHEAPDELETE(&H, &x)
}