//P 164

HEAP-INCREASE-KEY(A,i,key)
1 if key<A[i]{
2 	error "new key is smaller than current key"}
3 A[i]=key
4 while i>1 and A[PARENT(i)]<A[i]{
5	exchange A[i] with A[PARENT(i)]
6	i=PARENT(i)}

MAX-HEAP-INSERT(A,key)
1 A.heap-size=A.heap-size +1
2 A[A.heap-size]=INT_MIN
3 HEAP-INCREASE-KEY(A, A.heap-size, key)