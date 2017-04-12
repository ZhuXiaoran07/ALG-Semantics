 
 void GCD(a, b)
 if a!=b
	if a>b
	return (GCD(a-b, b))
    else return (GCD(a, b-a))
	     
 else return (a)
 
 |

main()
{
	
	int m
	int n
	//int a
	//int b
	//int t
	m=10
	n=8
	GCD(m,n)
	return (0)

}

 