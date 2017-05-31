//P 365
int MEMOIZEDCUTROD(ArrType p,int n)
int r[n+1];
int i;
i=0;
while i<=n{
// let r[0..n] be a new array
 //for i=0 to n{
 	r[i]=-1;
	i=(i+1)};
 return (MEMOIZEDCUTRODAUX(&p,n,&r))
 
 int MEMOIZEDCUTRODAUX(ArrType p,int n,ArrType r)
int i;
int q;
 if r[n]>=0
 	return (r[n]);
 if n==0
 	q=0
 else {q=-1;
     //  i=0;
	   while i<=n{
		//for i=1 to n{
			q=max(q, (p[i]+MEMOIZEDCUTRODAUX(&p,(n-i+1),&r)));
		i=(i+1)}};
 r[n]=q;
 return (q)
 
  int max(int a, int b)

	if a>b
	   return (a)
	 else 
		 return (b)
	 
	 main(){
	 int n;
	n=4;
	int B[n];
	B[0]=0;
	B[1]=2;
	B[2]=6;
	B[3]=8;
	//B[4]=9;
  MEMOIZEDCUTROD(&B,n)} 

