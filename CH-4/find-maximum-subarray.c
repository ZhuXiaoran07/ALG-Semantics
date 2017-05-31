//P72

void FINDMAXIMUMSUBARRAY(ArrType A, int low, int high)
int mid;
int lefthigh;
int leftlow;
int leftsum;
int righthigh;
int rightlow;
int rightsum;
int crosshigh;
int crosslow;
int crosssum;
 if high==low
	return(low,high,A[low])   //base case: only one element
 else{
	 mid=(low+high)/2;
	(leftlow, lefthigh, leftsum)=
		FINDMAXIMUMSUBARRAY(&A,low,mid);
	(rightlow, righthigh, rightsum)=
		FINDMAXIMUMSUBARRAY(&A,mid+1,high); // mid+1 can not parse
	(crosslow, crosshigh, crosssum)=
		FINDMAXCROSSINGSUBARRAY(&A,low,mid, high)};
 if leftsum>=rightsum and leftsum>=crosssum
	return(leftlow, lefthigh, leftsum)
 elseif rightsum>=leftsum and rightsum>=crosssum
	return(rightlow, righthigh, rightsum)
 else return(crosslow, crosshigh, crosssum)
		
 
void FINDMAXCROSSINGSUBARRAY(ArrType A, int low, int mid, int high)
int leftsum;
int sum;
int i;
int maxleft;
int maxright;
int rightsum;
 leftsum=-1;
 sum=0;
 i=mid;
 while i>low{
 //for i=mid downto low{
	sum=sum+A[i];
	if sum>leftsum{
		leftsum=sum;
		maxleft=i	};
		i=i-1};
 right=-1;
 sum=0;
 j=mid+1;
 while j<high{
 //for j=mid+1 to high{
	sum=sum+A[j];
	if sum>rightsum{
		rightsum=sum;
        maxright=j};
		j=j+1};
 return(maxleft, maxright, leftsum,rightsum)
 

main(){
	int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
	FINDMAXIMUMSUBARRAY(&B, 0, 4);
	return (0)
}		

