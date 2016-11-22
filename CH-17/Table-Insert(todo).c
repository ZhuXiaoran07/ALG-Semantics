//P464
TABLE-INSERT(T,x)
if T.size==0{
	allocate T.table with 1 slot
	insert all items in T.table
	free T.table
	T.table=new-table
	T.size=2*T*size}
insert x into T.table
T.num=T.num+1