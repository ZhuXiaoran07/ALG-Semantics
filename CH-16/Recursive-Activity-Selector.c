//P419
int RECURSIVEACTIVITYSELECTOR(ArrType s, ArrType f,int k,int n)
int m;
m=k+1;
while m<=n and s[m]<f[k]
	m=m+1;
if m>=n
	return ({a[m]} SUNION RECURSIVEACTIVITYSELECTOR(&s,&f,m,n))
else return (EMPTY)


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
RECURSIVEACTIVITYSELECTOR(&A, &B, 0, 2)}