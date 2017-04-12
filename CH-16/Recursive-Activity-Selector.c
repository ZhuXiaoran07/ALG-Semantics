//P419
RECURSIVEACTIVITYSELECTOR(s,f,k,n)
m=k+1
while m<=n and s[m]<f[k]
	m=m+1
if m<=n
	return {a[m]} UNION RECURSIVEACTIVITYSELECTOR(s,f,m,n)
else return EMPTY