


//P553
VEBEMPTYTREEINSERT(V,x)
V.min=x
V.max=x

VEBTREEINSERT(V,x)
if V.min==NIL
	VEBEMPTYTREEINSERT(V,x)
elseif x<V.min{
	exchange x with V.min
	if V.u>2
		if VEBTREEMINIMUM(V.cluster[high(x)])==NIL{
			VEBTREEINSERT(V.summary,high(x))
			VEBEMPTYTREEINSERT(V.cluster[high(x)],low(x))}
		else VEBTREEINSERT(V.cluster[high(x)],low(x))}
	if x>V.max
		V.max=x