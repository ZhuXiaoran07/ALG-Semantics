//P821
int LUDECOMPOSITION(ArrType A)
int n;
n=A.rows;
int L[n][n];
int U[n][n];

int k;
int i;
int j;

k=0;
while k<n
{
	L[k][k]=1;
	k=(k+1)
};
k=0;
/*let L and U be new n*n matrices
initialize U with 0s below the diagonal
initialize L with 1s on the diagonal and 0s above the diagonal*/
while (k<n){
//for k=1 to n{
	U[k][k]=A[k][k];
	i=(k+1);
	while i<n{
	//for i=k+1 to n{
		L[i][k]=(A[i][k]/U[k][k]);
		U[k][i]=A[k][i];
		i=(i+1)
		};
	i=(k+1);
	while i<n{
	//for i=k+1 to n{
	j=(k+1);
	while j<n{
	//	for j=k+1 to n{
			A[i][j]=(A[i][j]-L[i][k]*U[k][j]);
			j=(j+1)
			};
			i=(i+1)};
			k=(k+1)};
//return L and U
return;

main(){
		int A[3][4];
	//	int B[4][3];
		A[0][0]=1;
		A[0][1]=2;
		A[0][2]=3;
		A[0][3]=4;
		A[1][0]=8;
		A[1][1]=5;
		A[1][2]=7;
		A[1][3]=3;
		A[2][0]=4;
		A[2][1]=9;
		A[2][2]=7;
		A[2][3]=6;
		LUDECOMPOSITION(&A);
		return (0)
}




