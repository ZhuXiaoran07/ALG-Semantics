// P291
ITERATIVETREESEARCH(x,k)
 while x!=NIL and k!=x.key
	if k<x.key
		x=x.left
	else x=x.right
 return x