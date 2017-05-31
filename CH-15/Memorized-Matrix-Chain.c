//P 388
int MEMORIZEDMATRIXCHAIN(ArrType p)
int n;
n=(p.length-1);
int m[n][n];
//let m[1..n,1..n] be a new table
int i;
int j;
i=0;
while i<=n-1{
//for i=1 to n{
	j=i;
	while j<=n-1{
	//for j=i to n{
		m[i][j]=10000;
		j=(j+1)};
		i=(i+1)};
return (LOOKUPCHAIN(&m,&p,1,n-2))


int LOOKUPCHAIN(ArrType m,ArrType p,int i,int j)
int k;
int q;
if m[i][j] < 10000
return (m[i][j]);
if i==j
m[i][j]=0
else{
	k=i;
	while k<=j-1{
	//for k=i to j-1{
	q=(LOOKUPCHAIN(&m,&p,i,k)+LOOKUPCHAIN(&m,&p,k+1,j)+p[i-1]*p[k]*p[j]); //made some change 
	  if q<m[i][j]
m[i][j]=q;
k=(k+1)}};
return (m[i][j])

   main(){
	 int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=2;
	B[2]=6;
	B[3]=8;
	B[4]=9;
  MEMORIZEDMATRIXCHAIN(&B)}