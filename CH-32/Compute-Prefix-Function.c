//P1006
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

main()
{
		 int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
    COMPUTEPREFIXFUNCTION(&B);
	return;

}