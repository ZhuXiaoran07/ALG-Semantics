//P366
int BOTTOMUPCUTROD(ArrType p,int n)
int r[n];
// let r[0..n] be a new array
 r[0]=0;
 int j;
 int i;
 int q;
 j=1;
 while j<n{
 //for j=1 to n{
 	q=-1;
	i=1;
	while i<j{
	//for i=1 to j
		q=max(q, p[i]+r[j-i]);
	r[j]=q;
	i=(i+1)};
	j=(j+1)};
 return (r[n-1])
 
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
  BOTTOMUPCUTROD(&B, 4)}