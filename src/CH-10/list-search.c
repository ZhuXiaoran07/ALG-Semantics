//P250
COMPACT-LIST-SEARCH(L,n,k)
1 i=L
2 while i!=NIL and key[i]<k{
3   j=RANDOM(1,n)
4 	if key[i]<key[j] and key[j]<=k{
5 		i=j}
6	if key[i]==k{
7 		return i}
8 	i=next[i]}
9 if i==NIL or key[i]>k{
10 	 return NIL}
11 else{return i}

