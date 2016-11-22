//P 179

RANDOMIZED-PARTITION(A,p,r)
 i=RANDOM(p,r)
 exchange A[r] with A[i]
 return PARTITION(A,p,r)

RANDOMIZED-QUICKSORT(A,p,r)
 if p<r{
	q=RANDOMIZED-PARTITION(A,p,r)
	RANDOMIZED-QUICKSORT(A,p,q-1)
	RANDOMIZED-QUICKSORT(A,q+1,r)}

PARTITION(A,p,r)
 x=A[r]
 i=p-1
 for j=p to r-1{
	if A[j]<=x{
		i=i+1
		exchange A[i] with A[j]}}
 exchange A[i+1] with A[r]
 return i+1