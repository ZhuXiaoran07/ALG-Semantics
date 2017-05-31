//P492
struct tree{
	int height;
	struct treeNode *root
};

struct treeNode {
	int n ;
	bool leaf;
	int key[2*n-1];
	struct treeNode *c[2*n-1]
};


void BTREEINSERTNONFULL(struct treeNode *x,int k)
int i;
i=x.n;
int t;
t=4;
if x.leaf==TRUE{
	while i>=1 and k<x.key[i]{
		(x.key[i+1])=x.key[i];
		i=(i-1)};
	//(x.key[i+1]=k);
	x.n=(x.n+1);
	//DISKWRITE(x)
	return;}
	
else {while i>=1 and k<x.key[i]
		i=(i-1);
	i=(i+1);
	
	//DISK-READ(x,c[i])
	if x.c[i].n==(2*t-1){
		BTREESPLITCHILD(&x,i);
		if k>x.key[i]
			i=(i+1)};
	BTREEINSERTNONFULL(&x.c[i],k)};
	return;
	
void BTREESPLITCHILD(struct treeNode *x, int i)
struct treeNode *z;
struct treeNode *y;
int j;
int t;
t=4;
y=x.c[i];
z.leaf=y.leaf;
z.n=(t-1);
j=1;
while j<=t-1{
//for j=1 to t-1
	z.key[j]=y.key[j+t];
j=(j+1)};
if  y.leaf ==FALSE{ //made some changes
    j=1;
	while j<=t{
	//for j=1 to t
		z.c[j]=y.c[j+t];
j=(j+1)}};
y.n=(t-1);
j=(x.n+1);
while j>=i+1{
//for j=x.n+1 downto i+1
	x.c[j+1]=x.c[j];
j=j-1};
x.c[i+1]=z;
j=x.n;
while j>=i{
//for j=x.n downto i
	x.key[j+1]=x.key[j];
j=(j-1)};
x.key[j]=y.key[t];
x.n=(x.n+1);
return;

void BTREECREATE(struct tree *T)
struct treeNode *x;
x.leaf=TRUE;
x.n=0;
//DISK-WRITE(x)
T.root=&x;
return;

void BTREEINSERT(struct tree *T, int k)
struct treeNode *r;
r=T.root;
int t;
t=4;
if r.n==(2*t-1){
	struct treeNode s;
	T.root=s;
	s.leaf=FALSE;
	s.n=0;
	s.c[1]=r;
	BTREESPILTCHILD(&s,1);
	BTREEINSERTNONFULL(&s,k)}
else BTREEINSERTNONFULL(&r,k);
return;

void BTREESEARCH(struct treeNode *x, int k)
int i;
i=1;
while i<=x.n and k>x.key[i]
	i=i+1;
if i<=x.n and k==x.key[i]
	return(&x,i)
elseif x.leaf==TRUE  //made changes
	return (NIL)
else 
	  return (BTREESEARCH(&x.c[i],k))
  
  main()
  {
	  struct tree *T1;
	  BTREECREATE(&T1);
  
	struct treeNode *A;
	struct treeNode *B;
	 A.n=3;
	B.n=3;
     
	 BTREEINSERT(&T1,A.n);
	 BTREEINSERT(&T1,B.n)
  }
	  
	  