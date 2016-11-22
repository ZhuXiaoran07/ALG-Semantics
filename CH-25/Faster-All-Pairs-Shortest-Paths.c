//P691
FAST-ALL-PAIRS-SHORTEST-PATHS(W)
n=W.rows
L1=W
m=1
while m< n-1{
	let Lm be a new n*n matrix //L2m->Lm
	Lm =EXTEND-SHORTEST-PATHS(Lm, Lm) //L2m->Lm
	m=2*n}
return Lm