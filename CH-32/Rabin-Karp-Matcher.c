//P993
void RABINKARPMATCHER(ArrType T,ArrType P, int d, int q)
int n;
int m;
int h;
int p;
int s;
int f;

n=T.length;
m=P.length;
int t[n];
h=d^(m-1) mod q;
p=0;
t[0]=0;
int i;
i=0;
while i<m{
//for i=1 to m{
	p=(d*p+P[i]) mod q;
	t[0]=(d*t[0]+T[i]) mod q;
	i=(i+1)};
s=0;
while s<=(n-m){
//for s=0 to n-m
	if p==t[s]{
		i=0;
		f=0;
		while i<m{
			if P[i]!=T[s+i]
			     f=1;
			i=(i+1)	    
		} ;
		if f==0
			print ("Pattern occurs with shift");
		if s<n-m
	t[s+1]=(d*(ts-T[s+1]*h)+T[s+m+1]) mod q};
			s=(s+1)};
return;

main()
{
		 int n;
	 int m;
	 m=6;
	n=5;
	int B[n];
	int A[m];
	A[0]=1;
	A[1]=3;
	A[2]=5;
	A[3]=7;
	A[4]=9;
	A[5]=6;
	
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
    RABINKARPMATCHER(&A,&B, 2, 3);
	return;
}
		