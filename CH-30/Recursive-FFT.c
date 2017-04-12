//P911
RECURSIVEFFT(a)
n=a.length
if n==1
	return a
wn=e^(2*pi*i/n)
w=1
//a[0]=(a0,a2,...,an-2)
//a[1]=(a1,a3,...,an-1)
y[0]=RECURSIVE-FFT(a[0])
y[1]=RECURSIVE-FFT(a[1])
for k=0 to n/2-1{
	yk=yk[0]+wyk[1]
	yk+(n/2)=yk[0]-wyk[1]
	w=wwn}
return y