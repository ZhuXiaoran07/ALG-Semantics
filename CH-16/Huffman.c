//P431
HUFFMAN(C)
n=|C|
Q=C
for i=1 to n-1{
	allocate a new node z
	x=EXTRACT-MIN(Q)
	z.left=x//z.left=x=EXTRACT-MIN(Q)
	y=EXTRACT-MIN(Q)
	z.right=y//z.right=y=EXTRACT-MIN(Q)
	z.freq=x.freq+y.freq
	INSERT(Q,z)}
return EXTRACT-MIN(Q)