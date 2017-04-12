//P935

void EUCLID(a,b)
//t=a
if b==0
	return (a)
else return (EUCLID(b, a mod b))

|

main()
{
	int m
	int n
	m=12
	n=8
	EUCLID(m, n)
	
	return (0)
}
