//P797
MERGESORT'(A,p,r)
if p<r{
	q=(p+r)/2
	spawn MERGESORT'(A,p,q)
	MERGESORT'(A,q+1,r)
	sync
	MERGE(A,p,q,r)}