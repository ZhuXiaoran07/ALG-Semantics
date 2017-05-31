//P 421
int GREEDYACTIVITYSELECTOR(ArrType s,ArrType f)
int n;
int k;
int m;
SET A;
n=s.length;
A={a[1]};
k=1;
m=2;
while m<n{
//for m=2 to n{
	if s[m]>=f[k]{
		A=A SUNION {a[m]};    //Set Plus
		k=m};
		m=m+1};
return (A)

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
GREEDYACTIVITYSELECTOR(&A, &B)}