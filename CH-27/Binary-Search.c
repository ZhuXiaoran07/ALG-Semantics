//P799
void PMERGESORT(ArrType A, int p, int r, ArrType B, int s)
int n;
int q1;
int q;
n=(r-p+1);
if n==1
	B[s]=A[p]
else{ //let T[1..n] be a new array
	  int T[n-1];
	  q=(p+r)/2;
	  q1=(q-p+1);
	  spawn PMERGESORT(&A,p,q,&T,0);
	  PMERGESORT(&A,(q+1),r,&T,q1);
	 // sync
	  PMERGE(&T,1,q1,(q1+1),n,&B,s)};
return;
	  
	  
void PMERGE(ArrType T, int p1, int r1,int p2,int r2,ArrType A, int p3)
int n1;
int n2;
int t;
n1=(r1-p1+1);
n2=(r2-p2+1);
if n1<n2{
	t=p1;
	p1=p2;
	p2=t;
	t=r1;
	r1=r2;
	r2=t;
	t=n1;
	n1=n2;
	n2=t};
/*	exchange p1 with p2
	exchange r1 with r2
	exchange n1 with n2*/
if n1==0
	return;
else{q1=(p1+r1)/2;
	q2=BINARYSEARCH(T[q1],&T,p2,r2);
	q3=p3+(q1-p1)+(q2-p2);
	A[q3]=T[q1];
	spawn PMERGE(&T,p1,(q1-1),p2,(q2-1),&A,p3);
	PMERGE(&T,(q1+1),r1,q2,r2,&A,(q3+1))
	//sync
	};
return;
	
	
int BINARYSEARCH(int x,ArrType T, int p,int r)
int low;
int high;
int mid;
low=p;
high=max(p,r+1);
while low<high{
	mid=(low+high)/2;
	if x<=T[mid]
		high=mid
	else low=mid+1};
return (high)

int max(int x, int y)
{
  if (x < y) return (y);
  return (x)
}
 main(){
	/*n1=10
	n2=8
	let L[1..n1+1] and R[1..n2+1] be new arrays*/
	int n;
	n=5;
	int B[n];
	int A[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
	A[0]=7;
	A[1]=5;
	A[2]=9;
	A[3]=8;
	A[4]=1;
	
	
	//while (i<n){
	//B[i]=read()
	//i=i+1}
	//INSERTIONSORT(B[n])
	 PMERGESORT(&B, 1, 4, &A, 0);
	 return (0)
}