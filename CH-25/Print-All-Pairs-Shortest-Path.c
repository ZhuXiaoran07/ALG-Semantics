//P685
int FASTALLPAIRSSHORTESTPATHS(ArrType W)
int n;
int m;
n=W.rows;
int L[1][n][n];
L[1]=&W;
m=1;
//int L[2][n][n];
while m< n-1{
	//let Lm be a new n*n matrix //L2m->Lm
	int L[2*m][n][n];
	L[2*m] =EXTENDSHORTESTPATHS(&L[m], &L[m]); //L2m->Lm
	m=2*m};
return (&L[2])

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

void PRINTALLPAIRSSHORTESTPATH(ArrType P,int i,int j)
if i==j
	print (i)
elseif P[i][j]==NIL
	print ("no path from i to j exists")
else {PRINTALLPAIRSSHORTESTPATH(&P,i,P[i][j]);
	  print (j)};
	  return;


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
	FASTALLPAIRSSHORTESTPATHS(&B);
	PRINTALLPAIRSSHORTESTPATH(&B, 0, 1)
}