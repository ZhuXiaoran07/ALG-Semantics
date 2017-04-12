//P1119
GREEDYSETCOVER(X,F)
U=X
L=EMPTY
while U!=EMPTY{
	select an S belongsto F that maximizes |S INTERSECT U|
	U=U-S
	L=L SUNION {S}}
return L