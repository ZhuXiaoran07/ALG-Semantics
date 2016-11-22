//P688

//made some change l'ij->l'
EXTEND-SHORTEST-PATHS(L,W)
n=L.rows
let L'=l' be a new n*n matrix 
for i=1 to n{
	for j=1 to n{
		l'=INFINITY
		for k=1 to n{
			l'=min(l',lik+wkj)}}}
return L'