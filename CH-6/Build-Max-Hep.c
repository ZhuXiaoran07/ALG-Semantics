//P157
BUILDMAXHEAP(A)
A.heapsize=A.length
for i=A.length/2 downto 1
	MAXHEAPIFY(A,i)