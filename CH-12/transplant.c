//P 296
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

int TREEMINIMUM(struct treeNode *x)
 while x.left!=NIL
	x=&x.left;
print (x.key);
 return (x)
 


int height(struct treeNode t)
  if t == NIL
	  return (0);
  return (1 + max(height(t.left), height(t.right)))





 void TREEDELETE(struct tree *T,struct treeNode *z)
 struct treeNode *y;
if z.left==NIL
	TRANSPLANT(&T,&z,&z.right)
 else if z.right==NIL
 	TRANSPLANT(T,z,z.left)
 else y=TREEMINIMUM(z.right);
 if y.p!=z{
 	TRANSPLANT(&T,&y,&y.right);
 	y.right=z.right;
	y.right.p=y};
 TRANSPLANT(&T,&z,&y);
 y.left=z.left;
 y.left.p=y;
// T.height=T.height-1;
  return(&T)
 
 void TRANSPLANT(struct tree *T, struct treeNode *u, struct treeNode *v)
 if u.p==NIL
 	T.root=&v
 elseif u==u.p.left
 	u.p.left=v
 else u.p.right=v;
 if v!=NIL
 	v.p=u.p;
 return; 
 
  main()
 {
 struct tree *T1;
// T1.height=0;
  
	struct treeNode *A;
/*	struct treeNode *B;
	struct treeNode *C;
	struct treeNode *D;
	struct treeNode *E;
	int a;*/
	 A.key=10;
/*	B.key=11;
	C.key=9;
	D.key=12;
	E.key=8;
     */
	/*T1= TREEINSERT(&T1,&A);
	 T1= TREEINSERT(&T1,&B);
	 T1= TREEINSERT(&T1,&C);
	 T1= TREEINSERT(&T1,&D);
	  T1= TREEINSERT(&T1,&E);*/
	  T1=TREEDELETE(&T1, &A)
	 //  print(A.key)
	// INORDERTREEWALK(T1.root)
	// PREORDERTREEWALK(T1.root);
	  //POSTORDERTREEWALK(T1.root)
  // a=height(T1.root)
 }