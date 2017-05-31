//P371
int MATRIXMULTIPLY(ArrType A,ArrType B)
if A.columns!=B.rows{
print( "incompatible dimensions");
return;}
else {
	int c[A.rows][B.columns];
	//let C be a new A.rows * B.columns matrix
	int i;
	int j;
	int k;
	i=0;
	while (i< A.rows) {
	//for i=1 to A.rows
	j=0;
	while j<B.columns{
		//for j=1 to B.columns{
			c[i][j]=0;
			k=1;
			while k<A.columns{
			//for k=1 to A.columns
			c[i][j]=(c[i][j]+A[i][k]*B[k][j]);
			k=(k+1)};
		j=(j+1)};
	i=(i+1)};
	return (&c)}
	
	main(){
		int A[3][4];
		int B[4][3];
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
		B[0][0]=2;
		B[0][1]=3;
		B[0][2]=5;
		B[1][0]=4;
		B[1][1]=7;
		B[1][2]=9;
		B[2][0]=8;
		B[2][1]=3;
		B[2][2]=5;
		B[3][0]=10;
		B[3][1]=9;
		B[3][2]=8;
		
		MATRIXMULTIPLY(&A,&B)
		
	}