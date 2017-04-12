//P377
PRINTOPTIMALPARENS(s,i,j)
if i==j
	print "A"
else{print "("
	PRINTOPTIMALPARENS(s,i,s[i,j])
	PRINTOPTIMALPARENS(s,s[i,j]+1,j)
	print ")"}