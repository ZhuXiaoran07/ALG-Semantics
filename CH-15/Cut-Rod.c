// P364
int CUTROD(ArrType p,int n)
int q;
 if n==0
 	return (0);
 q=-1;
 int i;
 i=1;
 while i<n{
 //for i=1 to n
	q=max(q, p[i]+CUTROD(&p,n-1));
 i=(i+1)};
 return (q)
 
  int max(int a, int b)

	if a>b
	   return (a)
	 else 
		 return (b)
 
   main(){
	 int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=2;
	B[2]=6;
	B[3]=8;
	B[4]=9;
  CUTROD(&B, 4)}