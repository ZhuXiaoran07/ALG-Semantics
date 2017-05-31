//P793
int PSQUAREMATRIXMULTIPLY(ArrType A, ArrType B)
int n;
int i;
int j;
int k;
n=A.rows;
int C[n][n];
spawn{i=0;
while i<n{
	spawn{j=0;
	while j<n{
		C[i][j]=0;
		j=(j+1)
	}
	};
	k=0;
	while k<n{
		C[i][j]=(C[i][j]+A[i][k]*B[k][j]);
		k=(k+1)
	};
	i=i+1
}	
};
return (&C)

//let C be a new n*n matrix
/*parallel for i=1 to n
	parallel for j=1 to n{
		c[i][j]=0
		for k=1 to n
			c[i][j]=c[i][j]+a[i][k]*b[k][j]}
return C*/

main()
{
	int A[3][3];
	int B[3][3];
	A[0][0]=1;
	A[0][1]=2;
	A[1][0]=3;
	A[1][1]=4;
	A[1][2]=5;
	A[2][2]=6;
	B[0][0]=4;
	B[0][1]=5;
	B[1][0]=3;
	B[1][1]=7;
	B[1][2]=8;
	B[2][2]=2;
	PSQUAREMATRIXMULTIPLY(&A, &B)
}