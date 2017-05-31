//P776
int PFIB(int n)
if n<=1
	return (n)
else{x=spawn PFIB(n-1);
	 y=PFIB(n-2);
	// sync
	 return (x+y)}
	 
	 
main()
{
	
	int m;
	
	m=7;
	PFIB(m);
	return (0)

}
