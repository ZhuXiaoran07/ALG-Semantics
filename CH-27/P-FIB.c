//P776
PFIB(n)
if n<=1
	return n
else{x=spawn PFIB(n-1)
	 y=PFIB(n-2)
	 sync
	 return x+y}