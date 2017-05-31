//P988
void NAIVESTRINGMATHCER(ArrType T, ArrType P)
int n;
int m;
int f;
int i;
n=T.length;
m=P.length;
int s;
s=0;
while s<=n-m{
	//if p==t[s]{
		i=0;
		f=0;
		while i<m{
			if P[i]!=T[s+i]
			     f=1;
			i=(i+1)	    
		} ;
		if f==0
	print ("Pattern occurs with shift");
s=(s+1)};
return;
/*for s=0 to n-m
	if P[1..m]==T[s+1..s+m]
		print "Pattern occurs with shift s"*/
		
		
main(){
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
	NAIVESTRINGMATHCER(&A, &B);
	return;
}