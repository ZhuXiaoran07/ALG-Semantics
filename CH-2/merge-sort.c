//P34
void MERGESORT(ArrType A,int p,int r)
int q;
 if p<r{
 q=(p+r)/2 ;
   MERGESORT(&A,p,q);
   MERGESORT(&A,q+1,r); // can not parse q+1
 MERGE(&A,p,q,r)};
 return;

 
 
void MERGE(ArrType A,int p,int q,int r)
int n1;
int n2;
 n1=q-p+1;
 n2=r-q;
 int L[n1];
 int R[n2];
 int i;
 int j;
 int k;
 //for i=1 to n1
 i=1;
 while i<n1-1{
	L[i-1]=A[p+i-1];
    i=i+1};
j=1;
while j<n2-1{
 //for j=1 to n2
	R[j-1]=A[q+j];
    j=j+1};
 //L[n1+1]=100;
 //R[n2+1]=100;
 i=1;
 j=1;
 k=p;
 while k<r-1{
 //for k=p to r
 	if L[i-1]<=R[j-1]{
	A[k]=L[i-1];
	i=i+1}
	else{A[k]=R[j-1];
	j=j+1};
 k=k+1};
 return;
	
 

main(){
	/*n1=10
	n2=8
	let L[1..n1+1] and R[1..n2+1] be new arrays*/
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
	 MERGESORT(&B, 0, 4);
	 return (0)
}