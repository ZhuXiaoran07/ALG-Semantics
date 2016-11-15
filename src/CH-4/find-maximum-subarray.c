//P72

FIND-MAXIMUM-SUBARRAY(A, low, high)
1 if high==low{
2	return(low,high,A[low])}    //base case: only one element
3 else{
4	(left-low, left-high, left-sum)=
		FIND-MAXIMUM-SUBARRAY(A,low,high)
5	(right-low, right-high, right-sum)=
		FIND-MAXIMUM-SUBARRAY(A,mid+1,high)
6	(cross-low, cross-high, cross-sum)=
		FIND-MAX-CROSSING-SUBARRAY(A,low,mid, high)}
7 if left-sum>=right-sum and left-sum>=cross-sum{
8	return(left-low, left-high, left-sum)}
9 elseif right-sum>=left-sum and right-sum>=cross-sum{
10	return(right-low, right-high, right-sum)}
11 else{return(cross-low, cross-high, cross-sum)}
		
		
//P71		
FIND-MAX-CROSSING-SUBARRAY(A,low,mid, high)
1 left-sum=INT_MIN
2 sum=0
3 for i=mid downto low{
4	sum=sum+A[i]
5	if sum>left-sum{
6		left-sum=sum
7		max-left=i	}}
8 right=INT_MIN
9 sum=0
10 for j=mid+1 to high{
11	sum=sum+A[j]
12	if sum>right-sum{
13		right-sum=sum
14        max-right=j}}
15 return(max-left, max-right, left-sum+right-sum)
