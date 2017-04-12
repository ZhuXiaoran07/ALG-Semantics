//P551
VEBTREESUCCESSOR(V,x)
if V.u==2
	if x==0 and V.max==1
		return 1
	else return NIL
elseif V.min!=NIL and x<V.min
	return V.min
else{maxlow=VEBTREEMAXIMUM(V.cluster[high(x)])
	if maxlow!=NIL and low(x)<maxlow{
		offset=VEBTREESUCCESSOR(V.cluster[high(x)],low(x))
		return index(high(x),offset)}
	else{ succcluster=VEBTREESUCCESSOR(V.summary, high(x))
		if succcluster==NIL
			return NIL
		else{offset=VEBTREEMINIMUM(V.cluster[V.cluster[succcluster]])
			return index(succcluster,offset)}}}