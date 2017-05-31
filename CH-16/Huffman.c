//P431
struct tree{
	int height;
	struct treeNode *root
};
struct treeNode {
	int freq ;
	//int height;
	struct treeNode *left ;
	struct treeNode *right
	//struct treeNode p
	// node root
};



int HUFFMAN(struct tree *C)
//n=|C|
int n;
int i;
int x;
int y;
n=C.height;
struct tree *Q;
Q=&C;
struct treeNode *z;
i=0;
while i<=n-1{
//for i=1 to n-1{
	
	x=EXTRACTMIN(&Q.root);
	z.left=x;//z.left=x=EXTRACT-MIN(Q)
	y=EXTRACTMIN(&Q.root);
	z.right=y;//z.right=y=EXTRACT-MIN(Q)
	z.freq=(x.freq+y.freq);
	TREEINSERT(&Q,&z)};
return (EXTRACTMIN(&Q.root))

int TREEINSERT(struct tree *T, struct treeNode *z)
struct treeNode *y;
struct treeNode *x;
//int NIL
y=NIL;
 x=T.root;
 //y=T.root
 while x!=NIL{
 	y=&x;
 	if z.freq<x.freq
 		x=&x.left
 	else x=&x.right};
// z.p=y;
 if y==NIL
 	T.root=&z //tree T was empty
 elseif z.freq<y.freq
 	y.left=z
else y.right=z;
T.height=(T.height+1);
return (&T)


int EXTRACTMIN(struct treeNode *x)
 while x.left!=NIL
	x=x.left;
 return (&x)



 

 
  main()
 {
 struct tree *T1;
 T1.height=0;
  
	struct treeNode *A;
	struct treeNode *B;
	int a;
	 A.freq=10;
	B.freq=11;
     T1= TREEINSERT(&T1,&A);
	// T1= TREEINSERT(&T1,&B);
	 HUFFMAN(&T1)
	 
 }

	
 
 
 
 
 