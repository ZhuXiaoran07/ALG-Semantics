//P201
// change

BUCKETSORT(A)
 let B[0..n-1] be a new array
 n=A.length
 for i=0 to n-1
	B[i]=NIL
 for i=1 to n
	B[n*A[i]]=A[i]
 for i=0 to n-1
	INSERTIONSORT(B)
 concatenate(B)