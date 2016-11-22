//P554
VEB-TREE-DELETE(V,x)
if V.min==V.max{
	v.min=NIL
	V.max=NIL}
elseif V.u==2{
	if x==0
		V.min=1
	else V.min=0
	V.max=V.min}
elseif x==V.min{
	first-cluster=vEB-TREE-MINIMUM(V.summary)
	x=index(first-cluster,
		vEB-TREE-MINIMUM(V.cluster[first-cluster]))
	V.min=x
	vEB-TREE-DELETE(V.cluster[high(x)],low(x))
	if vEB-TREE-MINIMUM(V.cluster[high(x)]==NIL){
		vEB-TREE-DELETE(V.summary, high(x))
		if x==V.max{
			summary-max=vEB-TREE-MAXIMUM(V.summary)
			if summary-max==NIL
				V.max=V.min
			else{V.max=index(summary-max,
					vEB-TREE-MAXIMUM(V.cluster[summary-max]))}
		elseif x==V.max{
			V.max=index(high(x),
				vEB-TREE-MAXIMUM(V.cluster[high(x)])}}}}