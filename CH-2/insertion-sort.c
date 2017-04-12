//P 18
void INSERTIONSORT(A)
    j=2 
	while j< A.length{
	    key=A[j]
		//A[j]=key
		
		//Insert A[j] into the sorted sequence A[1..j-1]
		i=j-1
		while i>0 and A[i]>key{
		A[i+1]=A[i]
	i=i-1}
	A[i+1]=key
	j=j+1}	
	
main(){
	n=5
	int B[n]
	B[0]=0
	B[1]=8
	B[2]=6
	B[3]=9
	B[4]=2
	
	//while (i<n){
	//B[i]=read()
	//i=i+1}
	//INSERTIONSORT(B[n])
	return INSERTIONSORT(B)
}