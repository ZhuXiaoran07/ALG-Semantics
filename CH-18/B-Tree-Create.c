//P492
B-TREE-CREATE(T)
x=ALLOCATE-NODE()
x.leaf=TRUE
x.n=0
DISK-WRITE(x)
T.root=x