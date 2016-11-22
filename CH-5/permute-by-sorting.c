//P125
PERMUTE-BY-SORTING(A)
 n=A.length
 let P[1..n] be a new array
 for i=1 to n{
	P[i]=RANDOM(1,n^3)
 sort A, using P as sort keys


RANDOM-IN-PLACE(A)
 n=A.length
 for i=1 to n{
	swap A[i] with A[RANDOM(i,n)]}