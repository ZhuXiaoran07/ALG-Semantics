// P238
LIST-SEARCH'(L,k)
 x=L.nil.next
 while x!=NIL and x.key!=k{
 	x=x.next}
 return x

LIST-INSERT(L,x)
 x.next=L.nil.next
 	L.nil.next.prev=x
 L.nil.next=x
 x.prev=NIL

LIST-DELETE'(L,x)
 	x.prev.next=x.next
 	x.next.prev=x.prev