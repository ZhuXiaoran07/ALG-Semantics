//P 164



void MAXHEAPINSERT(ArrType A, int key)
 A.length=(A.length +1);
 A[A.length-1]=-1;
 HEAPINCREASEKEY(&A, A.length-1, key);
 return;
 
 
 void HEAPINCREASEKEY(ArrType A,int i,int key)
 int t;
 if key<A[i]
 	print ("new key is smaller than current key");
 A[i]=key;
 while i>1 and A[PARENT(i)]<A[i]{
	 t=A[i];
	 A[i]=A[PARENT(i)];
	 A[PARENT(i)]=t;
	//exchange A[i] with A[PARENT(i)]
	i=PARENT(i)};
	return;
	
void PARENT(int i)
 return (i/2)
 
 main(){
	  int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
	MAXHEAPINSERT(&B, 10)
 }