//P 154
MAX-HEAPIFY(A,i)
1 l=LEFT(i)
2 r=RIGHT(i)
3 if l<=A.heap-size and A[l]>A[i]{
4 largest=l}
5 else{largest=i}
6 if r<=A.heap-size and A[r]>A[largest]{
7 largest=r}
8 if largest!=i{
9 exchange A[i] with A[largest]
10 MAX-HEAPIFY(A, largest)}


HEAP-EXTRACT-MAX(A)
1 if A.heap-size<1{
2	error "heap underflow"}
3 max=A[1]
4 A[1]=A[A.heap-size]
5 A.heap-size=A.heap-size-1
6 MAX-HEAPIFY(A,1)
7 return max