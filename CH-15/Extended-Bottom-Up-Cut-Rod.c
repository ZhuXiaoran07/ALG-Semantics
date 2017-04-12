//P369
EXTENDEDBOTTOMUPCUTROD(p,n)
 let r[0..n] and s[0..n] be new arrays
 r[0]=0
 for j=1 to n{
	q=-INFINITY
	for i=1 to j
		if q<p[i]{   //should be q<p[i]+r[j-i]
			q=p[i]+r[j-i]
	s[j]=i}
 	r[j]=q}
 return r and s

PRINTCUTRODSOLUTION(p,n)
(r,s)=EXTENDEDBOTTOMUPCUTROD(p,n)
while n>0{
	print s[n]
	n=n-s[n]}