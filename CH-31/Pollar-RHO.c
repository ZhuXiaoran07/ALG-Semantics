//P976
POLLARDRHO(n)
i=1
x[1]=RANDOM(0,n-1)
y=x[1]
k=2
while TRUE{
	i=i+1
	x[i]=(x[i-1]^2) mod n
	d=gcd(y-x[i],n)
	if d!=1 and d!=n
		print d
	if i==k{
		y=xi
		k=2*k}}