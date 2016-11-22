//P371
MATRIX-MULTIPLY(A,B)
if A.columns!=B.rows
error "incompatible dimensions"
else {let C be a new A.rows * B.columns matrix
	for i=1 to A.rows{
		for j=1 to B.columns{
			cij=0
			for k=1 to A.columns{
			cij=cij+aik.bkj}}}
	return C}