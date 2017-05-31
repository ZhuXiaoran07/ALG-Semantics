//P918
int ITERATIVEFFT(ArrType a)
//BITREVERSECOPY(&a,A);
int n;
int s;
int k;
int j;
int m;
n=a.length;
int w[n+1];
int A[n];
s=1;
while s<(lg n){
//for s=1 to lgn{
	m=2^s;
	//w[m]=e^(2*pi*i/m);
    w[m]=2*i/m;
	k=0;
	while k<n-1{
	//for k=0 to n-1 by m{
		w[0]=1;
		j=0;
	while j<=m/2-1{
		//for j=0 to m/2-1{
			t=w*A[k+j+m/2];
			u=A[k+j];
			A[k+j]=(u+t);
			A[k+j+m/2]=(u-t);
			w=w*w[m];
			j=(j+1)};
			k=(k+1)};
			s=(s+1)};
return (&A)

void BITREVERSECOPY(ArrType a, ArrType A)
int n;
n=a.length;
int k;
k=0;
while k<=n-1{
//for k=0 to n-1
//A[rev(k)]=a[k];
k=(k+1)
};
return;

main()
{
	int m;
	m=read();
	int a[m];
	int i;
	i=0;
	while i<m
	{
		a[i]=read();
		i=(i+1)
	};
	ITERATIVEFFT(&a);
	return;
	
}