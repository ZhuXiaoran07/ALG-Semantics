//P957
MODULAREXPONENTIATION(a,b,n)
c=0
d=1
let <bk,bk-1,...,b0> be the binary representation of b
for i=k downto 0{
	c=2*c
	d=(d*d) mod n
	if bi==1{
		c=c+1
		d=(d*a) mod n}}
return d