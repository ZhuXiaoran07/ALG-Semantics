// P294

struct tree{
	int height;
	struct treeNode *root
};

struct treeNode {
	int key ;
	//int height;
	struct treeNode *left ;
	struct treeNode *right;
	struct treeNode *p
	// node root
};



int max(int a, int b)

	if a>b
	   return (a)
	 else 
		 return (b)


int height(struct treeNode *t)
  if t == NIL
	  return (0);
  return (1 + max(height(t.left), height(t.right)))



int TREEINSERT(struct tree *T, struct treeNode *z)
struct treeNode *y;
struct treeNode *x;
int a;

//int NIL
//y=NIL;
 x=&T.root;
 //y=T.root
 while x!=NIL{
 	y=&x;
 	if z.key<x.key
 		x=&x.left
 	else x=&x.right};
 //z.p=&y;
 if y==NIL
 	T.root=&z //tree T was empty
 elseif z.key<y.key
 	y.left=&z
else y.right=&z;
return (&T)


void INORDERTREEWALK(struct treeNode *x)
 if x!=NIL{
	INORDERTREEWALK(&x.left);
	print (x.key);
 INORDERTREEWALK(&x.right)};
 return;


 main()
 {
 struct tree *T1;
// T1.height=0;
  int a;
struct treeNode *A;
/*	struct treeNode *B;
	struct treeNode *C;
	struct treeNode *D;
	struct treeNode *E;
	int a;

	B.key=11;
	C.key=9;
	D.key=12;
	E.key=8;*/
    A.key=10;
	T1= TREEINSERT(&T1,&A);
	//a=tree_height(T1.root)
/*	 T1= TREEINSERT(&T1,&B);
	T1= TREEINSERT(&T1,&C);
	 T1= TREEINSERT(&T1,&D);
	  T1= TREEINSERT(&T1,&E);*/
	//  GetValue<T1.root>
	  //  print(A.key)
	 INORDERTREEWALK(&T1.root)
	// PREORDERTREEWALK(T1.root);
	  //POSTORDERTREEWALK(T1.root)
 //  a=height(T1.root)
 }