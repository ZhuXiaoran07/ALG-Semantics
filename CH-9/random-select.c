//P 216
RANDOMIZEDSELECT(A, p, r,i)
 if p==r
	return A[p]
 q=RANDOMIZEDPARTITION(A,p,r)
 k=q-p+1
 if i==k //the pivot value is the answer
	return A[q]
 elseif i<k 
	return RANDOMIZED-SELECT(A, p, q-1,i)
 else return RANDOMIZED-SELECT(A, q+1, r, i-k)