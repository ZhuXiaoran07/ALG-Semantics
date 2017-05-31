
//P342


struct tree{
	int height;
	struct treeNode* root;
	int leng
	
};

struct treeNode {
	int key ;
	//int height;
	struct treeNode* left ;
	struct treeNode* right;
	struct treeNode* p;
	bool color;
	int leng
	// node root
};



int OSSELECT(struct treeNode* x, int i)
int r;
x.leng=0;
 r=(x.leng+1);
 if i==r
 	return (x)
 elseif i<r
 	return (OSSELECT(x.left,i))
 else return (OSSELECT(x.right, i-r))
 
 void RBINSERT(struct tree* T, struct treeNode* z)
struct treeNode* y;
struct treeNode* x;
 y=NIL;
 x=&T.root;
 while x!=NIL{
 	y=&x;
 	if z.key<x.key
		x=&x.left
 	else x=&x.right};
 z.p=y;
 if y==NIL
 	T.root=z
 elseif z.key<y.key
 	y.left=z
 else y.right=z;
 z.left=NIL;
 z.right=NIL;
 z.color=RED;
 //RBINSERTFIXUP(&T,&z);
 T.leng=(T.leng+1);
 return (&T)
 
void RBINSERTFIXUP(struct tree* T, struct treeNode* z)
 while z.p.color==RED
	if z.p==z.p.p.left{
		y=z.p.p.right;
		if y.color==RED{
			z.p.color=BLACK;
			y.color=BLACK;
			z.p.p.color=BLACK;
			z=z.p.p}
		elseif z==z.p.right{
			z=z.p;
			LEFTROTATE(&T,z);
 			z.p.color=BLACK;
			z.p.p.color=RED;
			RIGHTROTATE(&T,&z.p.p)}
    else
		 {
		y=z.p.p.left;
		if y.color==RED{
			z.p.color=BLACK;
			y.color=BLACK;
			z.p.p.color=BLACK;
			z=z.p.p}
		else if z==z.p.left{
			z=z.p;
			LEFTROTATE(T,z);
 			z.p.color=BLACK;
			z.p.p.color=RED;
		 LEFTROTATE(&T,&z.p.p)}}};
 T.root.color=BLACK ;
 return;
 
 void LEFTROTATE(struct tree* T, struct treeNode* z)
 y=&x.right;  //set y
 x.right=y.left ; //turn y's left subtree into x's right subtree
 if y.left!=NIL
 	y.left.p=x;
 y.p=x.p  ; //link x's parent to y
 if x.p==NIL
 	T.root=y
 elseif x==x.p.left
 	x.p.left=y
 else x.p.right=y;
 y.left=x ; //put x on y's left
 x.p=y;
 return;

void RIGHTROTATE(struct tree* T, struct treeNode* z)
 y=&x.left;  //set y
 x.left=y.right;  //turn y's left subtree into x's right subtree
 if y.right!=NIL
 	y.right.p=x;
 y.p=x.p;   //link x's parent to y
 if x.p==NIL
 	T.root=y
 elseif x==x.p.left
 	x.p.left=y
 else x.p.right=y;
 y.right=x;  //put x on y's left
 x.p=y;
 return;

 int OSRANK(struct tree* T, struct treeNode* x)
 int r;
 struct treeNode* y;
 x.leng=0;
 r=(x.left.leng+1);
 y=&x;
 while y!=T.root{
 	if y==y.p.right
		r=(r+y.p.left.leng+1);
 y=y.p};
 return (r)
 
 
 main()
 {
 struct tree* T1;
  T1.leng=0;
	struct treeNode* A;
	//struct treeNode* B;
	 
	 A.key=10;
	//B.key=11;
	T1= RBINSERT(&T1,&A);
	// T1= RBINSERT(&T1,&B);
	 A=OSSELECT(&T1.root, 1);
	 OSRANK(&T1, T1.root)
	
    
 }
 
 
 
 