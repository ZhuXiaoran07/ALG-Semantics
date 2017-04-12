

//P 154
HEAPEXTRACTMAX(A)
 if A.heapsize<1
	error "heap underflow"
 max=A[1]
 A[1]=A[A.heapsize]
 A.heapsize=A.heapsize-1
 MAXHEAPIFY(A,1)
 return max