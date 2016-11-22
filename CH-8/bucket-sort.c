//P201
// to parse

BUCKET-SORT(A)
 let B[0..n-1] be a new array
 n=A.length
 for i=0 to n-1{
	make B[i] an empty list}
 for i=1 to n{
	insert A[i] into list B[n*A[i]]}
 for i=0 to n-1{
	sort list B[i] with insertion sort}
 concatenate the list B[0] B[1],...,B[n-1] togerther in order