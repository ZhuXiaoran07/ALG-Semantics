//P949
MODULARLINEAREQUATIONSLOVER(a,b,n)
(d,x',y')=EXTENDED-EUCLID(a,n)
if d|b{
	x[0]=x'*(b/d) mod n
	for i=0 to d-1
print (x[0]+i*(n/d)) mod n}
else print "no solutions"