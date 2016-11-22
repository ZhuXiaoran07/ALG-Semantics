//P369
EXTENDED-BOTTOM-UP-CUT-ROD(p,n)
 let r[0..n] and s[0..n] be new arrays
 r[0]=0
 for j=1 to n{
	q=INT_MIN
	for i=1 to j{
		if q<p[i]{   //should be q<p[i]+r[j-i]
			q=p[i]+r[j-i]
	s[j]=i}}
 	r[j]=q}
 return r and s

PRINT-CUT-ROD-SOLUTION(p,n)
(r,s)=EXTENDED-BOTTOM-UP-CUT-ROD(p,n)
while n>0{
	print s[n]
	n=n-s[n]}