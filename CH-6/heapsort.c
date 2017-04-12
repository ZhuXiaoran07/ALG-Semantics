//P160
HEAPSORT(A)
BUILDMAXHEAP(A)
for i=A.length downto 2{
	exchange A[1] with A[i]
	A.heapsize=A.heapsize-1
	MAXHEAPIFY(A,1)}