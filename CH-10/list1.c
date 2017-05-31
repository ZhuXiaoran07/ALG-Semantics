// P238

struct ListNode{
	
	struct ListNode *next;
	struct ListNode *prev;
	int key
};

struct List{
	struct ListNode *head;
	struct ListNode *nil
};



int LISTSEARCH1(struct List *L, int k)
struct ListNode *x;
 x=L.nil.next;
 while x!=NIL and x.key!=k
 	x=x.next;
 return (x)

int LISTINSERT1(struct List *L,struct ListNode *x)
struct ListNode *y;
 x.next=L.nil.next;
 //y=&L.nil;
 //y.next.prev=x
 //L.nil.next.prev=x;  //fix the bug
 L.nil.next=x;
 x.prev=NIL;
 return(&L)

int LISTDELETE1(struct List *L,struct ListNode *x)
 	x.prev.next=x.next;
 	x.next.prev=x.prev;
	return(&L)

main()
{
	struct List *L;
	struct ListNode *x;
	struct ListNode *y;
	x.key=10;
	y.key=11;
	L=LISTINSERT1(&L,x);
	L=LISTINSERT1(&L,y);
	y=LISTSEARCH1(&L, 10);
	L=LISTDELETE1(&L,y);
	return;	
}