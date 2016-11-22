//P152

BUILD-MAX-HEAP(A)
 A.heap-size=A.length
 for i=A.length downto 1{
	MAX-HEAPIFY(A,i)}

PARENT(i)
 return i/2

LEFT(i)
 return 2*i

RIGHT(i)
 return 2*i+1




//todo
MAX-HEAPIFY(A,i)
 l=LEFT(i)
 r=RIGHT(i)
 if l<=A.heap-size and A[l]>A[i]{
 largest=l}
 else{largest=i}
 if r<=A.heap-size and A[r]>A[largest]{
 largest=r}
 if largest!=i{
 exchange A[i] with A[largest]
 MAX-HEAPIFY(A, largest)}


