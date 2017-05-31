//P160
void HEAPSORT(ArrType A)
BUILDMAXHEAP(&A);
int i;
int t;
i=A.length-1;
while i>=1{
//for i=A.length downto 2{
	t=A[0];
	A[0]=A[i];
	A[i]=t;
	//exchange A[1] with A[i]
	A.length=(A.length-1);
	MAXHEAPIFY(&A,1);
	i=i-1};
	return;
	
	
void BUILDMAXHEAP(ArrType A)
int i;
i=A.length/2;
while i>=0{
//for i=A.length/2 downto 1
	MAXHEAPIFY(&A,i);
i=i-1};
return;
	
void PARENT(int i)
 return (i/2)


void LEFT(int i)
 return (2*i)

 
void RIGHT(int i)
 return (2*i+1)


void MAXHEAPIFY(ArrType A,int i)
int l;
int r;
int largest;
int t;
 l=LEFT(i);
 r=RIGHT(i);
 if l<=A.length-1 and A[l]>A[i]
 largest=l
 else largest=i;
 if r<=A.length-1 and A[r]>A[largest]
 largest=r;
 if largest!=i{
	 t=A[i];
	 A[i]=A[largest];
	 A[largest]=t;
 //exchange A[i] with A[largest]
 MAXHEAPIFY(&A, largest)};
 return ;
 
 main(){
	 int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
    HEAPSORT(&B);
	return;
}
 
 
 
 