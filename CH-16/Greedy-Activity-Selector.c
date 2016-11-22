//P 421
GREEDY-ACTIVITY-SELECTOR(s,f)
n=s.length
A={a1}
k=1
for m=2 to n{
	if s[m]>=f[k]{
		A=A+{am}    //Set Plus
		k=m}}
return A