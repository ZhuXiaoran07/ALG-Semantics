//P495
BTREEINSERT(T,k)
r=T.root
if r.n==2*t-1{
	s=ALLOCATENODE()
	T.root=s
	s.leaf=FALSE
	s.n=0
	s.c[1]=r
	BTREESPILTCHILD(s,1)
	BTREEINSERTNONFULL(s,k)}
else BTREEINSERTNONFULL(r,k)