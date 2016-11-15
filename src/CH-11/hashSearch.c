//P 271

HASH-SEARCH(T,k)
1 i=0
2 repeat{
3   j=h(h,i)
4	if T[j]==k{
5  		return j}
6    i=i+1}
7 until T[j]==NIL or i==m
8 return NIL