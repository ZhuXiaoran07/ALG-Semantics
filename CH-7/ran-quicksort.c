//P 179

int RANDOMIZEDPARTITION(ArrType A, int p, int r)
int i;
int t;
 i=RANDOM(p,r);
 t=A[r];
 A[r]=A[i];
 A[i]=t;
// exchange A[r] with A[i]
 return (PARTITION(&A,p,r))

void RANDOMIZEDQUICKSORT(ArrType A, int p,int r)
int q;
 if p<r{
	q=RANDOMIZEDPARTITION(&A,p,r);
	RANDOMIZEDQUICKSORT(&A,p,q-1);
	RANDOMIZEDQUICKSORT(&A,q+1,r)};
return;

int PARTITION(ArrType A, int p, int r)
int x;
int i;
int j;
int t;
x=A[r];
i=p-1;
j=p;
while j<=r-1
{
	if A[j]<=x{
		i=i+1;
		t=A[i];
		A[i]=A[j];
		A[j]=t};
j=j+1};
t=A[i+1];
A[i+1]=A[r];
A[r]=t;
return (i+1)

main(){
	int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
	
	//while (i<n){
	//B[i]=read()
	//i=i+1}
	//INSERTIONSORT(B[n])
	RANDOMIZEDQUICKSORT(&B, 0, 4);
	return (0)
}   