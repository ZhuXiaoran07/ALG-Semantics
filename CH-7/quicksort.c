// P171

QUICKSORT(A,p,r)
 if p<r{
  q=PARTITION(A,p,r)
	QUICKSORT(A,p,q-1)
 QUICKSORT(A, q+1, r)}
 

