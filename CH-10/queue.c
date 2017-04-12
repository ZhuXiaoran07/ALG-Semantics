// P235
void ENQUEUE(Q, x)
 Q[Q.tail]=x
 if Q.tail==Q.length
 	Q.tail=1
 else Q.tail=Q.tail+1
|

int DEQUEUE(Q)
 x=Q[Q.head]
 if Q.head==Q.length
 	Q.head=1
 else Q.head=Q.head+1
 return (x)
 |

 main()
 {
	 queue Q
	 //m=read()
	 ENQUEUE(Q, 3)
	 DEQUEUE(Q)
 }