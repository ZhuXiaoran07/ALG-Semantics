//P341
OS-SELECT(x,i)
1 r=x.left.size+1
2 if i==r{
3 	return x}
4 elseif i<r{
5 	return OS-SELECT(x.left,i)}
6 else{return OS-SELECT(x.right, i-r)}