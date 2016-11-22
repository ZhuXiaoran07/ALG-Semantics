//P494
B-TREE-SPLIT-CHILD(x,i)
z=ALLOCATE-NODE()
y=x.ci
z.leaf=y.leaf
z.n=t-1
for j=1 to t-1{
	z.keyj=y.keyj+t}
if  y.leaf ==FALSE{   //made some changes
	for j=1 to t{
		z.cj=y.cj+t}}
y.n=t-1
for j=x.n+1 downto i+1{
	x.keyj+1=x.keyj}
x.keyj=y.keyt
x.n=x.n+1
DISK-WRITE(y)
DISK-WRITE(z)
DISK-WRITE(x)