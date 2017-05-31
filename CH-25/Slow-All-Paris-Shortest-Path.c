//P689
int SLOWALLPAIRSSHORTESTPATHS(ArrType W)
int n;
n=W.rows;
int L[1][n][n];
L[1]=&W;
int m;
m=2;
while m<=(n-1){
	int L[m][n][n];
	L[m]=EXTENDSHORTESTPATHS(&L[m-1], &W);
	m=(m+1)
};
return (&L[n-1])
/*for m=2 to n-1{
	let Lm be a new n*n matrix
	Lm=EXTENDSHORTESTPATHS(Lm-1, W)}
return Ln-1*/


int EXTENDSHORTESTPATHS(ArrType L,ArrType W)
int n;
n=L.rows;
int L[1][n][n];
int i;
int j;
int k;
//let L'=l'[i][j] be a new n*n matrix 
i=0;
while i<n{
	j=0;
	while j<n{
		L[1][i][j]=1000;
		//j=(j+1)
	//};
	k=0;
	while k<n{
		L[1][i][j]=min(L[1][i][j], L[i][k]+W[k][j]);
		k=(k+1)
	};
j=(j+1)};
	i=(i+1)
};
return (&L[1])

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
	SLOWALLPAIRSSHORTESTPATHS(&B)
	//PRINTALLPAIRSSHORTESTPATH(&B, 0, 1)
}
