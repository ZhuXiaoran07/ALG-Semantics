//P164
HEAPINCREASEKEY(A,i,key)
 if key<A[i]
 	error "new key is smaller than current key"
 A[i]=key
 while i>1 and A[PARENT(i)]<A[i]{
	exchange A[i] with A[PARENT(i)]
	i=PARENT(i)}