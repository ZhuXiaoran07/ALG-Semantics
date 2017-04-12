//P366
MEMOIZEDCUTRODAUX(p,n,r)
 if r[n]>=0
 	return r[n]
 if n==0
 	q=0
 else {q=-INFINITY
		for i=1 to n{
			q=max(q, p[i]+MEMOIZEDCUTRODAUX(p,n-i,r))}}
 r[n]=q
 return q