//P699
FLOYDWARSHALL'(W)
n=W.rows
D=W
for k=1 to n
	for i=1 to n
		for j=1 to n
			d[i][j]=min(d[i][j],d[i][k]+d[k][j])
return D