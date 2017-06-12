//P 18
void INSERTIONSORT(ArrType A)
    int j=2 ;
	int i;
	int key;
	while j<A.length{
	    key=A[j];
		i=j-1;
		while i>0 and A[i]>key{
		A[i+1]=A[i];
	i=i-1};
	A[i+1]=key;
	j=j+1};
   return;	
	
main(){
	
	int B[3];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	
	INSERTIONSORT(&B)

}