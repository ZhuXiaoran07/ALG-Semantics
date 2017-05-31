//P786
void MATVECMAINLOOP(ArrType A, ArrType x, ArrType y, int n,int i, int i1)
int j;
int mid;
if i==i1{
	j=0;
	while j<n{
	y[i]=(y[i]+A[i][j]*x[i]);
	j=(j+1)
	}
}
	//for j=1 to n{
	//	y[i]=y[i]+a[i][j]*x[i]}
else{mid=((i+i1)/2);
	 spawn MATVECMAINLOOP(&A,&x,&y,n,i,mid);
	 MATVECMAINLOOP(&A,&x,&y,n,(mid+1),i1)
	 //sync
	 };
return;

main()
{
	int A[3][3];
	int B[3];
	int C[3];
	A[0][0]=1;
	A[0][1]=2;
	A[1][0]=3;
	A[1][1]=4;
	A[1][2]=5;
	A[2][2]=6;
	B[0]=2;
	B[1]=4;
	B[2]=6;
	C[0]=1;
	C[1]=3;
	C[2]=5;
	MATVECMAINLOOP(&A, &B, &C, 3, 0, 2)
	
}