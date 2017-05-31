//P911
int RECURSIVEFFT(ArrType a)
int n;
n=a.length;
int w[n+1];
int a1[n/2];
int a2[n/2];
int k;
int y1[n];
int y2[n];
int y[n];
if n==1
	return (&a);
//w[n]=e^(2*PI*i/n);
//w[n]=2*PI*i/n;
w[n]=2*n;
w[0]=1;
int i;
i=0;
while (i<n/2-1)
{
	a1[i]=a[2*i];
	a2[i]=a[2*i+1];
	i=(i+1)
};
//a[0]=(a0,a2,...,an-2)
//a[1]=(a1,a3,...,an-1)
y1=RECURSIVEFFT(&a1);
y2=RECURSIVEFFT(&a2);
k=0;
while k<= (n/2)-1{
//for k=0 to n/2-1{
	y[k]=(y[k[0]]+w[0]*y[k[1]]);
	y[k+(n/2)]=(y[k[0]]-w[0]*y[k[1]]);
	w[0]=w[0]*w[n];
	k=(k+1)
	};
return (y)
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
	RECURSIVEFFT(&a);
	return;
	
}