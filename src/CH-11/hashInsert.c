//P 270

HASH-INSERT(T,k)
1 i=0
2 repeat{
3   j=h(h,i)
4	if T[j]==NIL{
5 		T[j]=k
6  		return j}
7 else {i=i+1}}
8 until i==m
9 error "hash table overflow"