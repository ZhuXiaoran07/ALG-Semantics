//P 18
INSERTION-SORT(A)
1	for j=2 to A.length{
2	key=A[j]
		//Insert A[j] into the sorted sequence A[1..j-1]
3		i=j-1
4		while i>0 and A[i]>key{
5		A[i+1]=A[i]
6		i=i-1}
7	A[i+1]=key}