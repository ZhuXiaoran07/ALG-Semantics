//P543
PROTOVEBSUCCESSOR(V,x)
if V.u==2
	if x==0 and V.A[1]==1
		return 1
	elsereturn NIL
else{offset=PROTOVEBSUCCESSOR(V.cluster[high(x)],low(x))
	if offset!=NIL
		return index(high(x),offset)
	else{succcluster=PROTOVEBSUCCESSOR(V.summary,high(x))
		if succcluster==NIL
			return NIL
		else {offset=PROTOVEBMINIMUM(V.cluster[succcluster])
			 return index(succcluster,offset)}}}