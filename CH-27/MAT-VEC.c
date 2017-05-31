//P785
/*MATVEC(A,x)
n=A.rows
let y be a new vector of length n
parallel for i=1 to n
	y[i]=0
parallel for i=1 to n
	for j=1 to n
		y[i]=y[i]+a[i][j]*x[i]
return y*/
		
int MATVEC(ArrType A, ArrType x)
int n;
int i;
int j;
n=A.rows;
int y[n];
//let y be a new vector of length n

//parallel for i=1 to n
spawn{i=0;
while i<n{
spawn {j=0;
while j<n{
	y[i]=(y[i]+A[i][j]*x[j]);
j=(j+1)}
}; i=(i+1)}};	
/*parallel for i=1 to n
	parallel for j=1 to n
	y[i]=y[i]+a[i][j]*x[j]*/
return (y)

main(){
	
	int A[2][2];
	int B[2];
	A[0][0]=1;
	A[0][1]=2;
	A[1][0]=3;
	A[1][1]=4;
	B[0]=2;
	B[1]=4;
	
MATVEC(&A,&B)}
