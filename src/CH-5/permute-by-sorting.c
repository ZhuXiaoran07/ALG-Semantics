//P125
PERMUTE-BY-SORTING(A)
1 n=A.length
2 let P[1..n] be a new array
3 for i=1 to n{
4	P[i]=RANDOM(1,n^3)
5 sort A, using P as sort keys


RANDOM-IN-PLACE(A)
1 n=A.length
2 for i=1 to n{
3	swap A[i] with A[RANDOM(i,n)]}