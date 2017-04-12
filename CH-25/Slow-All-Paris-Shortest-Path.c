//P689
SLOWALLPAIRSSHORTESTPATHS(W)
n=W.rows
L1=W
for m=2 to n-1{
	let Lm be a new n*n matrix
	Lm=EXTENDSHORTESTPATHS(Lm-1, W)}
return Ln-1