//P550
VEBTREEMINIMUM(V)
return V.min

VEBTREEMAXIMUM(V)
return V.max

VEBTREEMEMBER(V,x)
if x==V.min or x==V.max
	return TRUE
elseif V.u==2
	return FALSE
else return VEBTREEMEMBER(V.cluster[high(x)],low(x))