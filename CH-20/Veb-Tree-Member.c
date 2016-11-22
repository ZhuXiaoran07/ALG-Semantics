//P550
VEB-TREE-MINIMUM(V)
return V.min

VEB-TREE-MAXIMUM(V)
return V.max

VEB-TREE-MEMBER(V,x)
if x==V.min or x==V.max
	return TRUE
elseif V.u==2
	return FALSE
else return VEB-TREE-MEMBER(V.cluster[high(x)],low(x))