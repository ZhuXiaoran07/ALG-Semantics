//P72

FIND-MAXIMUM-SUBARRAY(A, low, high)
 if high==low{
	return(low,high,A[low])}    //base case: only one element
 else{
	(left-low, left-high, left-sum)=
		FIND-MAXIMUM-SUBARRAY(A,low,high)
	(right-low, right-high, right-sum)=
		FIND-MAXIMUM-SUBARRAY(A,mid+1,high) // mid+1 can not parse
	(cross-low, cross-high, cross-sum)=
		FIND-MAX-CROSSING-SUBARRAY(A,low,mid, high)}
 if left-sum>=right-sum and left-sum>=cross-sum{
	return(left-low, left-high, left-sum)}
 elseif right-sum>=left-sum and right-sum>=cross-sum{
	return(right-low, right-high, right-sum)}
 else{return(cross-low, cross-high, cross-sum)}
		
		

