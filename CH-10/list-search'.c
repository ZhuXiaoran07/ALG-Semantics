//P251

COMPACTLISTSEARCH'(L,n,k,t)
 i=L
 for q=1 to t{
   j=RANDOM(1,n)
 	if key[i]<key[j] and key[j]<=k{
		i=j
		if key[i]==k
 		return i}}
 while i!=NIL and key[i]<k
 	i=next[i]
 if i==NIL or key[i]>k
	 return NIL
else return i