// P237
LIST-SEARCH(L,k)
 x=L.head
 while x!=NIL and x.key!=k{
 	x=x.next}
 return x

LIST-INSERT(L,x)
 x.next=L.head
 if L.head!=NIL{
 	L.head.prev=x}
 L.head=x
 x.prev=NIL

LIST-DELETE(L,x)
 if x.prev!=NIL{
 	x.prev.next=x.next}
 else{L.head=x.next}
 if x.next!=NIL{
 	x.next.prev=x.prev}