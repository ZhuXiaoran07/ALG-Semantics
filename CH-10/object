//P 244

ALLOCATEOBJECT()
 if free==NIL
 	error "out of space"
 else{x=free
	  free=x.next
	  return x}

FREEOBJECT(x)
 x.next=free
 free=x