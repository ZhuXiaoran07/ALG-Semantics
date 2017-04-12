//P688

//made some change l'ij->l'
EXTENDSHORTESTPATHS(L,W)
n=L.rows
let L'=l'[i][j] be a new n*n matrix 
for i=1 to n
	for j=1 to n{
		l'[i][j]=INFINITY
		for k=1 to n
			l'[i][j]=min(l'[i][j],l[i][k]+w[k][j])}
return L'