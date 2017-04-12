//P698
TRANSITIVECLOSURE(G)
n=|G.V|
let T<0>=t<0>[i][j] be a new n*n matrix
for i=1 to n
	for j=1 to n
		if i==j or (i,j) belongsto G.E
			t<0>[i][j]=1
		else t<0>[i][j]=0
for k=1 to n{
	let T<k>=t<k>[i][j] be a new n*n matrix
	for i=1 to n
		for j=1 to n
			t<k>[i][j]=t<k>[i][j] || (t<k-1>[i][k] && t<k-1>[k][j])}
return T<n>