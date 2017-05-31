//P402
int OPTIMALBST(ArrType p, ArrType q, int n) 
int e[n][n];
int w[n][n];
int root[n-1][n-1];
int i;
int l;
int r;
int t;
int j;
//let e[1..n+1,0..n], w[1..n+1,0..n]	
	//	and root[1..n, 1..n] be new tables
i=1;
while i<n-1{
//for i=1 to n+1{
	e[i][i]=q[i-1];
	w[i][i]=q[i-1];
	i=i+1};
	l=0;
	while l<n{
//for l=1 to n
i=1;

while i<(n-l+1){
//	for i=1 to n-l+1{
		j=i+l;
		e[i-1][j-1]=10000;
		w[i][j-1]=(w[i][j-1]+p[j]+q[j]);
		r=i;
		while r<=j-1{
		//for r=i to j
			t=(e[i][r-1] + e[r][j-1]+w[i][j-1]);
			if t<e[i][j-1]{
				e[i][j-1]=t;
				root[i-1][j-1]=r};
				r=r+1
			};
			l=l+1};
i=i+1};
return (&e, &root)

int PRINTOPTIMALPARENS(ArrType s,int i,int j)
if i==j
	print ("A")
else{print ("(");
	PRINTOPTIMALPARENS(&s,i,s[i][j]);
	PRINTOPTIMALPARENS(&s,s[i][j]+1,j);
	print (")")};
	return;
	
	
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
	 OPTIMALBST(&A, &B, n-1) }