//P250
COMPACTLISTSEARCH(L,n,k)
 i=L
 while i!=NIL and key[i]<k{
   j=RANDOM(1,n)
 	if key[i]<key[j] and key[j]<=k
 		i=j
	if key[i]==k
 		return i
	i=next[i]}
	if i==NIL or key[i]>k
 	 return NIL
 else return i

