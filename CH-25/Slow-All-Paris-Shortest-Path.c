//P689
SLOW-ALL-PAIRS-SHORTEST-PATHS(W)
n=W.rows
L1=W
for m=2 to n-1{
	let Lm be a new n*n matrix
	Lm=EXTEND-SHORTEST-PATHS(Lm-1, W)}
return Ln-1