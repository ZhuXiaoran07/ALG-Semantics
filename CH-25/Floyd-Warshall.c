//P695
int FLOYDWARSHALL(ArrType W)
int n;
int k;
int i;
int j;
n=W.rows;
int D[0][n][n];
D[0]=&W;
k=1;
while k<n{
	int D[k][n][n];
	i=1;
	while i<n{
		j=1;
		while j<n{
			D[k][i][j]=min(D[k-1][i][j], D[k-1][i][k]+D[k-1][k][j]);
			j=(j+1)
		};
		i=(i+1)
	};
	k=(k+1)
};
return(&D[n-1])
/*for k=1 to n{
	let Dk=dkij be a new n*n matrix
	for i=1 to n
		for j=1 to n
skij=min(m,n)}//dkij=min(dk-1ij, dk-1ik+dk-1kj)}}}
return Dn*/

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
	//PRINTALLPAIRSSHORTESTPATH(&B, 0, 1)
}