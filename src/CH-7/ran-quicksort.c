//P 179

RANDOMIZED-PARTITION(A,p,r)
1 i=RANDOM(p,r)
2 exchange A[r] with A[i]
3 return PARTITION(A,p,r)

RANDOMIZED-QUICKSORT(A,p,r)
1 if p<r{
2	q=RANDOMIZED-PARTITION(A,p,r)
3	RANDOMIZED-QUICKSORT(A,p,q-1)
4	RANDOMIZED-QUICKSORT(A,q+1,r)}

PARTITION(A,p,r)
1 x=A[r]
2 i=p-1
3 for j=p to r-1{
4	if A[j]<=x{
5		i=i+1
6		exchange A[i] with A[j]}}
7 exchange A[i+1] with A[r]
8 return i+1