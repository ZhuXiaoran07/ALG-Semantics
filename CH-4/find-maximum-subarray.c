//P72

void FINDMAXIMUMSUBARRAY(A, low, high)
 if high==low
	return(low,high,A[low])   //base case: only one element
 else{
	(leftlow, lefthigh, leftsum)=
		FINDMAXIMUMSUBARRAY(A,low,high)
	(rightlow, righthigh, rightsum)=
		FINDMAXIMUMSUBARRAY(A,mid+1,high) // mid+1 can not parse
	(crosslow, crosshigh, crosssum)=
		FINDMAXCROSSINGSUBARRAY(A,low,mid, high)}
 if leftsum>=rightsum and leftsum>=crosssum
	return(leftlow, lefthigh, leftsum)
 elseif rightsum>=leftsum and rightsum>=crosssum
	return(rightlow, righthigh, rightsum)
 else return(crosslow, crosshigh, crosssum)
		
| 
void FINDMAXCROSSINGSUBARRAY(A,low,mid, high)
 leftsum=-100
 sum=0
 i=mid
 while i>low{
 //for i=mid downto low{
	sum=sum+A[i]
	if sum>leftsum{
		leftsum=sum
		maxleft=i	}
		i=i-1}
 right=-100
 sum=0
 j=mid+1
 while j<high{
 //for j=mid+1 to high{
	sum=sum+A[j]
	if sum>rightsum{
		rightsum=sum
        maxright=j}
		j=j+1}
 return(maxleft, maxright, leftsum,rightsum)
 
 |

main(){
	n=5
	int B[n]
	B[0]=0
	B[1]=8
	B[2]=6
	B[3]=9
	B[4]=2
	return FINDMAXIMUMSUBARRAY(B, 0, 4)
}		

