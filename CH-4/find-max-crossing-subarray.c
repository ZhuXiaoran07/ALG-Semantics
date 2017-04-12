//P71		
void FINDMAXCROSSINGSUBARRAY(A,low,mid, high)
 leftsum=-100
 sum=0
 for i=mid downto low{
	sum=sum+A[i]
	if sum>leftsum{
		leftsum=sum
		maxleft=i	}}
 right=-100
 sum=0
 for j=mid+1 to high{
	sum=sum+A[j]
	if sum>rightsum{
		rightsum=sum
        maxright=j}}
 return(maxleft, maxright, leftsum,rightsum)