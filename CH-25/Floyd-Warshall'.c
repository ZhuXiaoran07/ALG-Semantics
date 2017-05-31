//P699
int FLOYDWARSHALL(ArrType W)
int n;
n=W.rows;
int D[n][n];
D=&W;
int k;
int i;
int j;
while k<n{
	while i<n{
		while j<n{
			D[i][j]=min(D[i][j], D[i][k]+D[k][j]);
			j=(j+1)
		};
		i=(i+1)
	};
	k=(k+1)
};
return (&D)
/*
for k=1 to n
	for i=1 to n
		for j=1 to n
			d[i][j]=min(d[i][j],d[i][k]+d[k][j])
return D*/

int min(int a, int b)

	if a<b
	   return (a)
	 else 
		 return (b)

	main(){
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
	FLOYDWARSHALL(&B)
	}