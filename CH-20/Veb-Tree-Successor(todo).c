//P551
VEB-TREE-SUCCESSOR(V,x)
if V.u==2
	if x==0 and V.max==1
		return 1
	else return NIL
elseif V.min!=NIL and x<V.min
	return V.min
else{max-low=VEB-TREE-MAXIMUM(V.cluster[high(x)])
	if max-low!=NIL and low(x)<max-low{
		offset=VEB-TREE-SUCCESSOR(V.cluster[high(x)],low(x))
		return index(high(x),offset)}
	else{ succ-cluster=VEB-TREE-SUCCESSOR(V.summary, high(x))
		if succ-cluster==NIL
			return NIL
		else{offset=VEB-TREE-MINIMUM(V.cluster[V.cluster[succ-cluster]])
			return index(succ-cluster,offset)}}}