//P917
ITERATIVEFFT(a)
BITREVERSECOPY(a,A)
n=a.length
for s=1 to lgn{
	m=2^s
	wm=e^(2*pi*i/m)
	for k=0 to n-1 by m{
		w=1
		for j=0 to m/2-1{
			t=wA[k+j+m/2]
			u=A[k+j]
			A[k+j]=u+t
			A[k+j+m/2]=u-t
			w=wwm}}}
return A

BITREVERSECOPY(a,A)
n=a.length
for k=0 to n-1
A[rev(k)]=ak