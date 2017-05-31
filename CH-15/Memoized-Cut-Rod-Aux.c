//P366
int MEMOIZEDCUTRODAUX(ArrType p,int n,ArrType r)
int i;
int q;
 if r[n]>=0
 	return (r[n]);
 if n==0
 	q=0
 else {q=-1;
       i=0;
	   while i<=n{
		//for i=1 to n{
			q=max(q, p[i]+MEMOIZEDCUTRODAUX(&p,(n-i+1),&r));
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
	 int m;
	 m=7;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=2;
	B[2]=6;
	B[3]=8;
	B[4]=9;
	int A[m];
	A[0]=1;
	A[1]=2;
	A[2]=3;
	A[3]=5;
	A[4]=7;
	A[5]=4;
	A[6]=6;
	MEMOIZEDCUTRODAUX(&A, 4, &B)
	 }