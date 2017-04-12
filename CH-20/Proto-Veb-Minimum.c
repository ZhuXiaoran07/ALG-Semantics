//p542
PROTOVEBMINIMUM(V)
if V.u==2
	if V.A[0]==1
		return 0
	elseif V.A[1]==1
			return 1
	else return NIL
else {mincluster=PROTOVEBMINIMUM(V.summary)
	if mincluster==NIL
		return NIL
	else{offset=PROTOVEBMINIMUM(V.cluster[mincluster])
return index(min-cluster,offset)}}