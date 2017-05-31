//P 394
int LCSLENGTH(ArrType X,ArrType Y)
int m;
int n;
int i;
int j;
m=X.length;
n=Y.length;
int b[m][n];
int c[m+1][n+1];
//let b[1..m,1..n] and c[0..m,0..n] be new tables
i=0;
while i<=(m-1){
//for i=1 to m
	c[i][0]=0;
i=(i+1)};
j=0;
while j<=n{
//for j=0 to n
	c[0][j]=0;
j=(j+1)};
i=1;
while i<=(m-1){
//for i=1 to m
j=1;
while j<=n-1{
//	for j=1 to n
		if X[i]==Y[j]{
			c[i][j]=(c[i-1][j-1]+1);
			//b[i,j]=LEFT}
			b[i][j]=1}
		elseif c[i-1][j]>=c[i][j-1]{
			c[i][j]=c[i-1][j];
		   // b[i,j]=UP}
			 b[i][j]=0}
		else {c[i][j]=c[i][j-1];
			 // b[i,j]=RIGHT}
			   b[i][j]=-1};
      j=(j+1)};
i=(i+1)};
return ( &b)

int PRINTLCS(ArrType b,ArrType X,int i,int j)
if i==0 or j==0
	return (NIL);
if b[i-1][j-1]==1{
	PRINTLCS(&b,&X,i-2,j-2);
	print (X[i-1])}
elseif b[i-1][j-1]==0
	PRINTLCS(&b,&X,i-2,j-1)
else PRINTLCS(&b,&X,i-1,j-2)

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
	int C[m][n];
	C=LCSLENGTH(&A, &B);
 PRINTLCS(&C, &A, m, n)}
 // PRINTCUTRODSOLUTION(&B, 4)}
