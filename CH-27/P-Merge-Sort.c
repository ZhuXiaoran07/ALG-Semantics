//P803
//question
PMERGESORT(A,p,r,B,s)
n=r-p+1
if n==1
	B[s]=A[p]
else{ let T[1..n] be a new array
	  q=(p+r)/2
	  q'=q-p+1
	  spawn PMERGESORT(A,p,q,T,1)
	  PMERGESORT(A,q+1,r,T,q'+1)
	  sync
	  PMERGE(T,1,q',q'+1,n,B,s)}