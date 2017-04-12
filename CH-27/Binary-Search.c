//P799
BINARYSEARCH(x,T,p,r)
low=p
high=max(p,r+1)
while low<high{
	mid=(low+high)/2
	if x<=T[mid]
		high=mid
	else low=mid+1}
return high