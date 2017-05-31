//P 315

struct tree{
	int height;
	struct treeNode* root
};

struct treeNode {
	int key ;
	//int height;
	struct treeNode* left ;
	struct treeNode* right;
	struct treeNode* p;
	char color
	// node root
};

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
 RBINSERTFIXUP(T,z);
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
			LEFTROTATE(T,z);
 			z.p.color=BLACK;
			z.p.p.color=RED;
			RIGHTROTATE(T,z.p.p)}
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
		 LEFTROTATE(T,z.p.p)}}};
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
  
 void RBDELETE(struct tree* T, struct treeNode* z)
 struct treeNode* x;
 struct treeNode* y;
 y=z;
 char yoriginalcolor;
 yoriginalcolor=y.color;
 if z.left==NIL{
 	x=z.right;
 	RBTRANSPLANT(T,z,z.right)}
 elseif z.right==NIL{
	x=z.left;
	RBTRANSPLANT(T,z,z.left)}
 else{y=TREEMINIMUM(z.right);
 	yoriginalcolor=y.color;
 	x=y.right;
 	if y.p==z
 		x.p=y
 	else{RBTRANSPLANT(T,y,y.right);
 		y.right=z.right;
 		y.right.p=y};
 	RBTRANSPLANT(T,z,y);
 	y.left=z.left;
 	y.left.p=y;
 	y.color=z.color};
	if yoriginalcolor==BLACK
 		RBDELETEFIXUP(T,x);
	return;		

void RBDELETEFIXUP(struct tree* T, struct treeNode* x)
 while x!=T.root and x.color==BLACK
 	if x==x.p.left{
 		w=x.p.right;
 	    if w.color==RED{
			w.color=BLACK;		//case 1
 			x.p.color=RED;		//case 1
 			LEFTROTATE(T,x.p);	//case 1
 			w=x.p.right};		//case 1
 		if w.left.color==BLACK and w.right.color==BLACK{
 			w.color=RED;			//case 2
 			x=x.p}				//case 2
 		elseif w.right.color==BLACK{
			w.left.color=BLACK;	//case 3
 			w.color=RED;			//case 3
			RIGHTROTATE(T,w);	//case 3
 			w=x.p.right};		//case 3
 		  w.color=x.p.color;		//case 4
		  x.p.color=BLACK;		//case 4
 		  w.right.color=BLACK;	//case 4
 		  LEFTROTATE(T,x.p);	//case 4
 		  x=T.root}				//case 4
   else {
 		w=x.p.left;
 	    if w.color==RED{
			w.color=BLACK;		//case 1
 			x.p.color=RED;		//case 1
 			RIGHTROTATE(T,x.p);	//case 1
 			w=x.p.left};		//case 1
 		if w.left.color==BLACK and w.right.color==BLACK{
 			w.color=RED;			//case 2
 			x=x.p}				//case 2
 		elseif w.left.color==BLACK{
			w.right.color=BLACK;	//case 3
 			w.color=RED;			//case 3
			LEFTROTATE(T,w);	//case 3
 			w=x.p.left};		//case 3
 		  w.color=x.p.color;		//case 4
		  x.p.color=BLACK;		//case 4
 		  w.left.color=BLACK;	//case 4
 		  RIGHTROTATE(T,x.p);	//case 4
 		  x=T.root};
 x.color=BLACK;
 return;
 
 void RBTRANSPLANT(struct tree* T, struct treeNode* u, struct treeNode* v)
 if u.p==NIL
		T.root=v
 elseif u==u.p.left
 		u.p.left=v
 else u.p.right=v;
 v.p=u.p;
 return;
 
 main()
 {
 struct tree* T1;
  
	struct treeNode* A;
	struct treeNode* B;
	 
	 A.key=10;
	B.key=11;
	T1= RBINSERT(&T1,&A);
	 //T1= RBINSERT(&T1,B);
	 RBDELETE(&T1, &A)
    
 }
 
 
 