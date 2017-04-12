//P 421
GREEDYACTIVITYSELECTOR(s,f)
n=s.length
A={a[1]}
k=1
for m=2 to n{
	if s[m]>=f[k]{
		A=A+{a[m]}    //Set Plus
		k=m}}
return A