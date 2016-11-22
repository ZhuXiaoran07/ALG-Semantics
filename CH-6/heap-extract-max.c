

//P 154
HEAP-EXTRACT-MAX(A)
 if A.heap-size<1
	error "heap underflow"
 max=A[1]
 A[1]=A[A.heap-size]
 A.heap-size=A.heap-size-1
 MAX-HEAPIFY(A,1)
 return max