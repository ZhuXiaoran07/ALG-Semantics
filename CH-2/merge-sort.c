//P34
MERGE-SORT(A,p,r)
 if p<r{
 q=(p+r)/2 
   MERGE-SORT(A,p,q)
   MERGE-SORT(A,q+1,r) // can not parse q+1
 MERGE(A,p,q,r)}
