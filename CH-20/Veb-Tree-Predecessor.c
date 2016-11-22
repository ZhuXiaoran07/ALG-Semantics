//P552
VEB-TREE-PREDECESSOR(V,x)
if V.u==2
	if x==1 and V.min==0
		return 0
	elsereturn NIL
elseif V.max!=NIL and x>V.max
	return V.max
else{min-low=VEB-TREE-MINIMUM(V.cluster[high(x)])
	if min-low!=NIL and low(x)>min-low{
		offset=VEB-TREE-PREDECESSOR(V.cluster[high(x)],low(x))
		return index(high(x),offset)}
	else{pred-cluster=VEB-TREE-PREDECESSOR(V.summary, high(x))
		if pred-cluster==NIL
			if V.min!=NIL and x>V.min
				return V.min
			else return NIL
		else{offset=VEB-TREE-MAXIMUM(V.cluster[pred-cluster])
return index(pred-cluster,offset)}}}