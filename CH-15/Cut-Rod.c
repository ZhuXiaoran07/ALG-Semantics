// P364
CUTROD(p,n)
 if n==0
 	return 0
 q=INFINITY
 for i=1 to n
	q=max(q, p[i]+CUTROD(p,n-1))
 return q