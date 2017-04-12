// P237
int LISTSEARCH(L,k)
 x=L.head
 while x!=NIL and x.key!=k
 	x=x.next
 return (x)
|
void LISTINSERT(L,x)
 x.next=L.head
 if L.head!=NIL
 	L.head.prev=x
 L.head=x
 x.prev=NIL
|
void LISTDELETE(L,x)
 if x.prev!=NIL
 	x.prev.next=x.next
 else L.head=x.next
 if x.next!=NIL
 	x.next.prev=x.prev
|
main()
{
	list L
	node x
	
	while x!=10
	{
	LISTINSERT(&L,x)
	x=x+1}
	
	
}