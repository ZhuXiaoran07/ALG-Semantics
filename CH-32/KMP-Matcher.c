//P1005
void KMPMATCHER(ArrType T,ArrType P)
int n;
int m;

int q;
n=T.length;
m=P.length;
int pi[m];
pi=COMPUTEPREFIXFUNCTION(&P);
q=0;
int i;
i=0;
while i<n{
//for i=1 to n{
	while q>0 and P[q+1]!=T[i]
		q=pi[q];
	if P[q+1]==T[i]
		q=(q+1);
	if q==m{
		print ("Pattern occurs with shift" );
q=pi[q]};
i=(i+1)
} ;
return;


int COMPUTEPREFIXFUNCTION(ArrType P)
int m;
m=P.length;
int pi[m];
//let pi[1..m] be a new array
pi[0]=0;
int k;
k=0;
int q;
q=1;
while q<m{
//for q=2 to m{
	while k>0 and P[k+1]!=P[q]{
	k=pi[k]};
	if P[k+1]==P[q]
		k=(k+1);
pi[q]=k;
q=(q+1)};
return (&pi)

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
    KMPMATCHER(&A,&B);
	return;
}
 