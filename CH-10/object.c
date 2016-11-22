//P 244

ALLOCATE-OBJECT()
 if free==NIL{
 	error "out of space"}
 else{x=free
	  free=x.next
	  return x}

FREE-OBJECT(x)
 x.next=free
 free=x