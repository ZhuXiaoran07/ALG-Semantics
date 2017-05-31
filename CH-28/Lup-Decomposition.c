//P824
void LUPDECOMPOSITION(ArrType A)
int n;
int k;
int k1;
int p;
int t;
int j;
n=A.rows;
int p1[n];
int i;
i=0;
while i<n{
	p1[i]=i;
	i=(i+1)
};
/*let pi[1..n] be a new array
for i=1 to n
	pi[i]=i*/
k=0;
while k<n{
//for k=1 to n{
	p=0;
	i=k;
	while i<n{
	//for i=k to n
		if A[i][k]>p{
			p=A[i][k];
		k1=i};
	i=(i+1)};
	if p==0
		print("singular matrix");
	t=p1[k];
	p1[k]=p1[k1];
	p1[k1]=t;
	//exchange pi[k] with pi[k']
	i=0;
	while i<n{
	//for i=1 to n{
		t=A[k][i];
		A[k][i]=A[k1][i];
		A[k1][i]=t;
	i=(i+1)};
		//exchange a[k][i] with a[k'][i]}
		i=(k+1);
		while i<n{
	//for i=k+1 to n{
		A[i][k]=A[i][k]/A[k][k];
		j=(k+1);
		while j<n{
		//for j=k+1 to n{
A[i][j]=(A[i][j]-A[i][k]*A[k][j]);
j=(j+1)};
i=(i+1)};
k=(k+1)};
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
		LUPDECOMPOSITION(&A);
		return (0)
}






