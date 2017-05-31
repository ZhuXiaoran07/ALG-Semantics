//P126
void RANDOMINPLACE(ArrType A)
int n;
int i;
int t;
 n=A.length;
 i=0;
 while i<=n-1{
 //for i=1 to n
 t=A[i];
A[i] =A[RANDOM(i,n)];
 A[RANDOM(i,n)]=t;
 i=i+1};
 return;
	
	
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
	RANDOMINPLACE(&B);
	return (0)
}