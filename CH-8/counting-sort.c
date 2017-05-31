//P 195
void COUNTINGSORT(ArrType A, ArrType B,int k)
int C[k];
int i;
int j;
 //let C[0..k] be a new array
 i=0;
 while i<=k-1{
 //for i=0 to k
	C[i]=0;
 i=i+1};
 j=1;
 while j<=(A.length-1){
// for j=1 to A.length
	C[A[j]]=(C[A[j]]+1);
 j=j+1};
 //C[i] now contains the number of elements equal to i
 i=1;
 while i<=k-1{ 
 //for i=1 to k
	C[i]=(C[i]+C[i-1]);
 i=i+1};
 //C[i] now contains the number of elements less than or equal to i
 j=(A.length-1);
 while j>=0{
 //for j=A.length downto 1{
	B[C[A[j]]]=A[j];
	C[A[j]]=(C[A[j]]-1);
	j=j-1};
return;
	
	
int MINIMUM(ArrType A)
int min;
 min=A[0];
 int i;
 i=1;
 while i<=(A.length-1){
 //for i=2 to A.length
	if min>A[i]
		min=A[i];
 i=i+1};
 return (min)
 
 
 int MAXIMUM(ArrType A)
int max;
 max=A[0];
 int i;
 i=1;
 while i<=(A.length-1){
 //for i=2 to A.length
	if max<A[i]
		max=A[i];
 i=i+1};
 return (max)
 
  main(){
	 int n;
	n=5;
	int l;
	
	int B[n];
	int A[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
	l=MAXIMUM(&B)-MINIMUM(&B)+1;
    COUNTINGSORT(&B, &A, l);
	return;
}
 
 
 
 