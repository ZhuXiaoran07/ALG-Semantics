//P 270

HASHINSERT(T,k)
 i=0
 repeat{
   j=h(h,i)
	if T[j]==NIL{
 		T[j]=k
  		return j}
 else i=i+1}
 until i==m
 error "hash table overflow"