//P724
FORD-FULKERSON(G,s,t)
for each edge(u,v) belongsto G.E{
	(u,v).f=0}
while there exists a path p from s to t in the residual network Gf{
	cf(p)=min(cf(u,v))// made some change:(u,v) is in p
	for each edge(u,v) in p{
		if (u,v) belongsto E
			(u,v).f=(u,v).f+cf(p)
else (v,u).f=(v,u).f-cf(p)}}