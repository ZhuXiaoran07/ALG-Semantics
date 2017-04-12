//P554
VEBTREEDELETE(V,x)
if V.min==V.max{
	v.min=NIL
	V.max=NIL}
elseif V.u==2{
	if x==0
		V.min=1
	else V.min=0
	V.max=V.min}
elseif x==V.min{
	firstcluster=vEBTREEMINIMUM(V.summary)
	x=index(firstcluster,
		vEBTREEMINIMUM(V.cluster[firstcluster]))
	V.min=x
	vEBTREEDELETE(V.cluster[high(x)],low(x))
	if vEBTREEMINIMUM(V.cluster[high(x)]==NIL){
		vEBTREEDELETE(V.summary, high(x))
		if x==V.max{
			summarymax=vEBTREEMAXIMUM(V.summary)
			if summarymax==NIL
				V.max=V.min
			else{V.max=index(summarymax,
					vEBTREEMAXIMUM(V.cluster[summarymax]))}
		elseif x==V.max{
			V.max=index(high(x),
				vEBTREEMAXIMUM(V.cluster[high(x)])}}}}