//P937
EXTENDEDEUCLID(a,b)
if b==0
	return (a, 1, 0)
else{(d',x',y')=EXTENDEDEUCLID(b,a mod b)
	 (d,x,y)=(d',y', x'-(a/b)*y')
	 return (d,x,y)}