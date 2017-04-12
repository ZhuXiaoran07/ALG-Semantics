//P755
RELABELTOFRONT(G,s,t)
INITIALIZEPREFLOW(G,s)
L=G.V-{s,t}//, in any order
for each vertex u belongsto G.V-{s,t}{
	u.current=u.N.head}
u=L.head
while u!=NIL{
	old-height=u.h
	DISCHARGE(u)
	if u.h>oldheight
		move u to the front of list L
	u=u.next}