//P935

void EUCLID(a,b)
t=a
if b==0
	return (a)
else return (EUCLID(b, t mod b))

|

main()
{
	m=12
	n=8
	g=EUCLID(m, n)
	
	return (0)
}
