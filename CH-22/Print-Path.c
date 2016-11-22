//P601
PRINT-PATH(G,s,v)
if v==s
	print s
elseif v.pi==NIL
	print "no path from s to v exists"//"no path from" s "to" v "exists"
else {PRINT-PATH(G,s,v,pi)
	print v}