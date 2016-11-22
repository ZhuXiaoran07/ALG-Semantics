//P 164

HEAP-INCREASE-KEY(A,i,key)
 if key<A[i]
 	error "new key is smaller than current key"
 A[i]=key
 while i>1 and A[PARENT(i)]<A[i]{
	exchange A[i] with A[PARENT(i)]
	i=PARENT(i)}

MAX-HEAP-INSERT(A,key)
 A.heap-size=A.heap-size +1
 A[A.heap-size]=INT_MIN
 HEAP-INCREASE-KEY(A, A.heap-size, key)