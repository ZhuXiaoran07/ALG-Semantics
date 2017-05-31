// P235

struct Queue{
	int tail;
	int head;
	int leng;
	ArrType data
	
};



int ENQUEUE(struct Queue* Q, int x)
 Q.data[Q.tail]=x;
 if Q.tail==Q.leng
 	Q.tail=1
 else Q.tail=(Q.tail+1);
 return (&Q)


int DEQUEUE(struct Queue* Q)
int x;
 x=Q.data[Q.head];
 if Q.head==Q.leng
 	Q.head=1
 else Q.head=(Q.head+1);
 return (x)
 

 main()
 {
	 struct Queue* Q;
	 Q.tail=0;
	 Q.head=0;
	 Q.leng=7;
	 int data[Q.leng];
	 Q.data=&data;
	 //m=read()
	 Q=ENQUEUE(&Q, 3);
	 DEQUEUE(&Q);
	 return (0)
 }