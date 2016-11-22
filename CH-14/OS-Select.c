//P341
OS-SELECT(x,i)
 r=x.left.size+1
 if i==r
 	return x
 elseif i<r
 	return OS-SELECT(x.left,i)
 else return OS-SELECT(x.right, i-r)