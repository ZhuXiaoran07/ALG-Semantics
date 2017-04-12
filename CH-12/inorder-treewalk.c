// P288
struct treeNode {
	int key ;
	//int height;
	struct treeNode left ;
	struct treeNode right;
	struct treeNode p
	// node root
};


void INORDERTREEWALK(struct treeNode x)
 if x!=NIL{
	INORDERTREEWALK(x.left);
	print (x.key);
 INORDERTREEWALK(x.right)};
 return; 