

//P 154
int HEAPEXTRACTMAX(ArrType A)
int max;
 if A.length<1
	print("heap underflow");
 max=A[0];
 A[0]=A[A.length-1];
 A.length=(A.length-1);
 MAXHEAPIFY(&A,1);
 return (max)
 
 void LEFT(int i)
 return (2*i)

 
void RIGHT(int i)
 return (2*i+1)

 
int HEAPMAXIMUM(ArrType A)
return (A[1])

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
	HEAPEXTRACTMAX(&B);
	return (0)
  }
	