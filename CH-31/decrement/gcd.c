 
 void GCD(a,b)
 if a!=b{
	if a>b
		return (GCD(a-b, b))
    else return (GCD(a, b-a))}
 else return (a)
 
 |

main()
{
	
	m=10
	n=5
	GCD(m, n)
}

 