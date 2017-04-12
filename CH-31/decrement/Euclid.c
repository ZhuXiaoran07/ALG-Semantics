//P935

void EUCLID(a,b)
t=a
if b==0
	return (a)
else return (EUCLID(b, t mod b))

|

main()
{
	m=10
	n=20
	EUCLID(m, n)
}
