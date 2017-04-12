//P1130
TRIM(L,TF)
L.length=m
L'=y[1]
last=y[1]
for i=2 to m
	if y[i]>last*(1+TF){
		append(L',yi)// yi onto the end of L'
		last=y[i]}
return L'