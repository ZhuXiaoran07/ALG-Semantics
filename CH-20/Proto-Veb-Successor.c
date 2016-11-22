//P543
PROTO-VEB-SUCCESSOR(V,x)
if V.u==2
	if x==0 and V.A[1]==1
		return 1
	elsereturn NIL
else{offset=PROTO-VEB-SUCCESSOR(V.cluster[high(x)],low(x))
	if offset!=NIL
		return index(high(x),offset)
	else{succ-cluster=PROTO-VEB-SUCCESSOR(V.summary,high(x))
		if succ-cluster==NIL
			return NIL
		else {offset=PROTO-VEB-MINIMUM(V.cluster[succ-cluster])
			 return index(succ-cluster,offset)}}}