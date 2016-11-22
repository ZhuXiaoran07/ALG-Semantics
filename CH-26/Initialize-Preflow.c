//P740
INITIALIZE-PREFLOW(G,s)
for each vertex v belongsto G.V{
	v.h=0
	v.e=0}
for each edge(u,v) belongsto G.E{
	(u,v).f=0}
s.h=|G.V|
for each vertex v belongsto s.Adj{
	(s,v).f=c(s,v)
	v.e=c(s,v)
	s.e=s.e-c(s,v)}