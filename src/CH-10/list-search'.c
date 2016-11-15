//P251

COMPACT-LIST-SEARCH'(L,n,k,t)
1 i=L
2 for q=1 to t{
3   j=RANDOM(1,n)
4 	if key[i]<key[j] and key[j]<=k{
5 		i=j
6		if key[i]==k{
7 		return i}}}
8 while i!=NIL and key[i]<k{
9 	i=next[i]}
10 if i==NIL or key[i]>k{
11 	 return NIL}
12 else{return i}