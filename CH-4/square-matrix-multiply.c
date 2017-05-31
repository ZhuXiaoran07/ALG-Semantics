//P 75

int SQUAREMARTIXMULTIPLY(ArrType A,ArrType B)
int n;
int i;
int j;
int k;
 n=A.rows;
 int C[n][n];
// let C be a new n*n matrix
i=0;
while i<=n-1{
// for i=1 to n{
	j=0;
	while j<=n-1{
	//for j=1 to n
		C[i][j]=0;
		k=0;
		while k<=n-1{
	//for k=1 to n
 		C[i][j]=(C[i][j]+A[i][k]*B[k][j]);
		k=k+1};
	j=j+1};
		
		i=i+1};
 return (&C)
 
 
 main(){
	
	int A[2][2];
	int B[2][2];
	A[0][0]=1;
	A[0][1]=2;
	A[1][0]=3;
	A[1][1]=4;
	B[0][0]=5;
	B[0][1]=6;
	B[1][0]=7;
	B[1][1]=8;
SQUAREMARTIXMULTIPLY(&A,&B)}