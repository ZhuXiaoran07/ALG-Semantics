//P152

BUILD-MAX-HEAP(A)
1 A.heap-size=A.length
2 for i=A.length downto 1{
3	MAX-HEAPIFY(A,i)}

PARENT(i)
1 return i/2

LEFT(i)
1 return 2*i

RIGHT(i)
1 return 2*i+1





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


