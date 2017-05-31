//P77
int SQUAREMATRIXMULTIPLYRECURSIVE(ArrType A, ArrType B)
int n;
n=A.rows;
int C[n][n];
//let C be a new n*n matrix
if n==1
	c[0][0]=a[0][0]*b[0][0]
else //partition A, B, and C as in equations(4.9)
	/*C[0][0]=SQUAREMATRIXMULTIPLYRECURSIVE(A[0][0], B[0][0])
		    +SQUAREMATRIXMULTIPLYRECURSIVE(A[0][1], B[1][0])
	C[0][1]=SQUAREMATRIXMULTIPLYRECURSIVE(A[0][0], B[0][1])
		   +SQUAREMATRIXMULTIPLYRECURSIVE(A[0][1], B[1][1])
    C[1][0]=SQUAREMATRIXMULTIPLYRECURSIVE(A[1][0], B[0][0])
		   +SQUAREMATRIXMULTIPLYRECURSIVE(A[1][1], B[1][0])
	C[1][1]=SQUAREMATRIXMULTIPLYRECURSIVE(A[1][0], B[0][1])
		   +SQUAREMATRIXMULTIPLYRECURSIVE(A[1][1], B[1][1])*/
  { C[0][0]=(A[0][0]*B[0][0]
		    +A[0][1]* B[1][0]);
	C[0][1]=(A[0][0]* B[0][1]
		   +A[0][1]* B[1][1]);
    C[1][0]=(A[1][0]* B[0][0]
		   +A[1][1]* B[1][0]);
	C[1][1]=(A[1][0]* B[0][1]
  +A[1][1]* B[1][1])};
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
SQUAREMATRIXMULTIPLYRECURSIVE(&A,&B)}