//P800
PMERGE(T,p1,r1,p2,r2,A,p3)
n1=r1-p1+1
n2=r2-p2+1
if n1<n2{
	exchange p1 with p2
	exchange r1 with r2
	exchange n1 with n2}
if n1==0
	return
else{q1=(p1+r1)/2
	q2=BINARYSEARCH(T[q1],T,p2,r2)
	q3=p3+(q1-p1)+(q2-p2)
	A[q3]=T[q1]
	spawn PMERGE(T,p1,q1-1,p2,q2-1,A,p3)
	PMERGE(T,q1+1,r1,q2,r2,A,q3+1)
	sync}