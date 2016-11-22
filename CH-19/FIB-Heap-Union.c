//P512
FIB-HEAP-UNION(H1,H2)
H=MAKE-FIB-HEAP()
H.min=H1.min
concatenate the root list of H2 with the root list of H
if (H1.min==NIL) or (H2.min!=NIL and H2.min.key<H1.min.key)
	H.min=H2.min
H.n=H1.n+H2.n
return H