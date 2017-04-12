//P794
PMATRIXMULTIPLYRECURSIVE(C,A,B)
n=A.rows
if n==1
	c[1][1]=a[1][1]*b[1][1]
else{ let T be a new n*n matrix
	 partition A, B, C, and T into n/2*n/2 submatrices
	spawn PMATRIXMULTIPLYRECURSIVE(C[1][1], A[1][1], B[1][1])
	spawn PMATRIXMULTIPLYRECURSIVE(C[1][2], A[1][1], B[1][2])
	spawn PMATRIXMULTIPLYRECURSIVE(C[2][1], A[2][1], B[1][1])
	spawn PMATRIXMULTIPLYRECURSIVE(C[2][2], A[2][1], B[1][2])
	spawn PMATRIXMULTIPLYRECURSIVE(C[1][1], A[1][2], B[2][1])
	spawn PMATRIXMULTIPLYRECURSIVE(T[1][1], A[1][2], B[2][1])
	spawn PMATRIXMULTIPLYRECURSIVE(T[1][2], A[1][2], B[2][2])
	spawn PMATRIXMULTIPLYRECURSIVE(T[2][1], A[2][1], B[2][1])
	PMATRIXMULTIPLYRECURSIVE(T[2][2], A[2][2], B[2][2])
	sync
	parallel for i=1 to n
		parallel for j=1 to n
c[i][j]=c[i][j]+t[i][j]}
	