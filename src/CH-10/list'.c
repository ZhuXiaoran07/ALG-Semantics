// P238
LIST-SEARCH'(L,k)
1 x=L.nil.next
2 while x!=NIL and x.key!=k{
3 	x=x.next}
4 return x

LIST-INSERT(L,x)
1 x.next=L.nil.next
2 	L.nil.next.prev=x
3 L.nil.next=x
4 x.prev=NIL

LIST-DELETE'(L,x)
1 	x.prev.next=x.next
2 	x.next.prev=x.prev