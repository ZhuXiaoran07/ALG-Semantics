//P201
// to parse

BUCKET-SORT(A)
1 let B[0..n-1] be a new array
2 n=A.length
3 for i=0 to n-1{
4	make B[i] an empty list}
5 for i=1 to n{
6	insert A[i] into list B[n*A[i]]}
7 for i=0 to n-1{
8	sort list B[i] with insertion sort}
9 concatenate the list B[0] B[1],...,B[n-1] togerther in order