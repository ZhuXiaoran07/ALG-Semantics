// P235
ENQUEUE(Q, x)
1 Q[Q.tail]=x
2 if Q.tail==Q.length{
3 	Q.tail=1}
4 else{Q.tail=Q.tail+1}

DEQUEUE(Q)
1 x=Q[Q.head]
2 if Q.head==Q.length{
3 	Q.head=1}
4 else {Q.head=Q.head+1}
5 return x