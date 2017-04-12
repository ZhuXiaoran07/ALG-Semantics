//P 164



MAXHEAPINSERT(A,key)
 A.heapsize=A.heapsize +1
 A[A.heapsize]=-INFINITY
 HEAPINCREASEKEY(A, A.heapsize, key)