//P552
VEB-TREE-PREDECESSOR(V,x)
if V.u==2
	if x==1 and V.min==0
		return 0
	else return NIL
elseif V.max!=NIL and x>V.max
	return V.max
else{minlow=VEBTREEMINIMUM(V.cluster[high(x)])
	if minlow!=NIL and low(x)>minlow{
		offset=VEBTREEPREDECESSOR(V.cluster[high(x)],low(x))
		return index(high(x),offset)}
	else{predcluster=VEBTREEPREDECESSOR(V.summary, high(x))
		if predcluster==NIL
			if V.min!=NIL and x>V.min
				return V.min
			else return NIL
		else{offset=VEBTREEMAXIMUM(V.cluster[predcluster])
return index(predcluster,offset)}}}