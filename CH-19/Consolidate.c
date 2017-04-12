//P513
CONSOLIDATE(H)
let A[0..D(H.n)] be a new array
for i=0 to D(H.n)
	A[i]=NIL
for each node w in the root list of H{
	x=w
	d=x.degree
	while A[d]!=NIL{
		y=A[d]		//another node with the same degree as x
		if x.key>y.key
			exchange x with y
		FIBHEAPLINK(H,y,x)
		A[d]=x
		d=d+1}
	A[d]=x}
H.min=NIL
for i=0 to D(H.n)
	if A[i]!=NIL
		if H.min==NIL{
			create a root list for H containing just A[i]
			H.min=A[i]}
		else{insert A[i] into H's root list
			if A[i].key<H.min.key
				H.min=A[i]}
				
FIB-HEAP-LINK(H,y,x)
remove y from the root list of H
make y a child of x, incrementing x.degree
y.mark=FALSE