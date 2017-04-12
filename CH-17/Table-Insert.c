//P464
TABLEINSERT(T,x)
if T.size==0{
	allocate T.table with 1 slot
	T.size=1}
if T.num==T.size{
	allocate newtable with 2*T*SIZE slots
	insert all items in T.table
	free T.table
	T.table=newtable
	T.size=2*T*SIZE}
insert x into T.table
T.num=T.num+1