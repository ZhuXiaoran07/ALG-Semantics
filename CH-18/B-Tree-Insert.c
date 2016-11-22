//P495
B-TREE-INSERT(T,k)
r=T.root
if r.n==2*t-1{
	s=ALLOCATE-NODE()
	T.root=s
	s.leaf=FALSE
	s.n=0
	s.c1=r
	B-TREE-SPILT-CHILD(s,1)
	B-TREE-INSERT-NONFULL(s,k)}
else{B-TREE-INSERT-NONFULL(r,k)}