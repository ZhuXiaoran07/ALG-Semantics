//P375
int MATRIXCHAINORDER(ArrType p)
int n;
n=(p.length-1);
int m[n][n];
int s[n-1][n-1];

//let m[1..n,1..n] and s[1..n-1,2..n] be new tables
int i;
int l;
int j;
int k;
int q;
i=0;

while i<n{
//for i=1 to n
m[i][i]=0;
i=(i+1)};
l=2;
while l<n{
//for l=2 to n		//l is the chain length
   i=1;
   while i<=(n-l){   
	//for i=1 to n-l+1{
		j=(i+l-1);
		m[i][j]=10000;
		k=i;
		while k<=j-1{
		//for k=i to j-1{
			q=(m[i][k]+m[k+1][j]+p[i-1]*p[k]*p[j]); //made some change
			if q<m[i][j]{
				m[i][j]=q;
				s[i][j-1]=k};
				k=(k+1)};
		i=(i+1)};
	l=(l+1)};
return (&m,&s)

 main(){
	 int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=2;
	B[2]=6;
	B[3]=8;
	B[4]=9;
  MATRIXCHAINORDER(&B)}