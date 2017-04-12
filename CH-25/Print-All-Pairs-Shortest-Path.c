//P685
PRINTALLPAIRSSHORTESTPATH(PI,i,j)
if i==j
	print i
elseif pi[i][j]==NIL
	print ("no path from i to j exists")
else {PRINTALLPAIRSSHORTESTPATH(PI,i,pi[i][j])
	  print j}
