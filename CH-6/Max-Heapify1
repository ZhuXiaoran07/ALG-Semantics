//P 154
MAXHEAPIFY(A,i)
 l=LEFT(i)
 r=RIGHT(i)
 if l<=A.heap-size and A[l]>A[i]
 largest=l
 else largest=i
 if r<=A.heap-size and A[r]>A[largest]
 largest=r
 if largest!=i{
 exchange A[i] with A[largest]
 MAXHEAPIFY(A, largest)}