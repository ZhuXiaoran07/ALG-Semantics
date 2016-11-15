//P 244

ALLOCATE-OBJECT()
1 if free==NIL{
2 	error "out of space"}
3 else{x=free
4	  free=x.next
5	  return x}

FREE-OBJECT(x)
1 x.next=free
2 free=x