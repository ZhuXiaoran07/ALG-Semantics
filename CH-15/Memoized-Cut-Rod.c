//P 365
MEMOIZEDCUTROD(p,n)
 let r[0..n] be a new array
 for i=0 to n{
 	r[i]=-INFINITY}
 return MEMOIZEDCUTRODAUX(p,n,r)

