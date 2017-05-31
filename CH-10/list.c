// P237

struct ListNode{
	
	struct ListNode *next;
	struct ListNode *prev;
	int key
};

struct List{
	struct ListNode *head
};

int LISTSEARCH(struct List *L,int k)
struct ListNode *x;
 x=L.head;
 while x!=NIL and x.key!=k
 	x=x.next;
 return (&x)
 



void LISTINSERT(struct List *L,struct ListNode *x)
 x.next=L.head;
 if L.head!=NIL
 	L.head.prev=x;
 L.head=x;
 x.prev=NIL;
 return (&L)

void LISTDELETE(struct List *L,struct ListNode *x)
 if x.prev!=NIL
 	x.prev.next=x.next
 else L.head=x.next;
 if x.next!=NIL
 	x.next.prev=x.prev;
return (&L)

main()
{
	struct List *L;
	struct ListNode *x;
	struct ListNode *y;
	x.key=10;
	y.key=11;
	L=LISTINSERT(&L,x);
	L=LISTINSERT(&L,y);
	y=LISTSEARCH(&L, 10);
	L=LISTDELETE(&L,y);
	return;	
}