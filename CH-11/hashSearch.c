//P 271

HASHSEARCH(T,k)
 i=0
 repeat{
   j=h(h,i)
	if T[j]==k
  		return j
    i=i+1}
 until T[j]==NIL or i==m
 return NIL