// P288
INORDER-TREE-WALK(x)
1 if x!=NIL{
2	INORDER-TREE-WALK(x.left)
3	print x.key
4	INORDER-TREE-WALK(x.right)}