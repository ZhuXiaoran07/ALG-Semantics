//P494
BTREESPLITCHILD(x,i)
z=ALLOCATENODE()
y=x.c[i]
z.leaf=y.leaf
z.n=t-1
for j=1 to t-1
	z.key[j]=y.key[j+t]
if  y.leaf ==FALSE  //made some changes
	for j=1 to t
		z.c[j]=y.c[j+t]
y.n=t-1
for j=x.n+1 downto i+1
	x.c[j+1]=x.c[j]
x.c[i+1]=z
for j=x.n downto i
	x.key[j+1]=x.key[j]
x.key[j]=y.key[t]
x.n=x.n+1
DISKWRITE(y)
DISKWRITE(z)
DISKWRITE(x)