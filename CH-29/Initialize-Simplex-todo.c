//P887
INITIALIZESIMPLEX(A,b,c)
let k be the index of the minimum bi
if bk>=0  
	return ({1,2,...,n}, {n+1, n+2,...,n+m},A,b,c,0 )
form Laux by adding -x0 to the left-hand side of each constraint
	and setting the obejective function to -x0
let (N,B,A,b,c,v) be the resulting slack form for Laux
l=n+k
(N,B,A,b,c,v)=PIVOT(N,B,A,b,c,v,l,0)
iterate the while loop of line 3-12 of SIMPLEX until an optimal solution
	to Laux is found
if the optimal solution to Laux sets x0' to 0
	if x0' is basic
		perform one (degenerate) pivot to make it nonbasic
	from the final slack form of Laux, remove x0 from the constraints and
		restore the original obejective function of L, but replace each basic
		variable in this obejective function by the right-hand side of its
		associate constraint
	return the modified final slack form
else return "infeasible"