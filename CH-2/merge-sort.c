//P34
void MERGESORT(A,p,r)
 if p<r{
 q=(p+r)/2 
   MERGESORT(A,p,q)
   MERGESORT(A,q+1,r) // can not parse q+1
 MERGE(A,p,q,r)}

 |
 
void MERGE(A,p,q,r)
 n1=q-p+1
 n2=r-q
 let L[1..n1+1] and R[1..n2+1] be new arrays
 //for i=1 to n1
 i=1
 while i<n1{
	L[i]=A[p+i-1]
    i=i+1}
j=1
while j<n2{
 //for j=1 to n2
	R[j]=A[q+j]
    j=j+1}
 L[n1+1]=100
 R[n2+1]=100
 i=1
 j=1
 k=p
 while k<r{
 //for k=p to r
 	if L[i]<=R[j]{
	A[k]=L[i]
	i=i+1}
	else{A[k]=R[j]
	j=j+1}
 k=k+1}
	
| 

main(){
	/*n1=10
	n2=8
	let L[1..n1+1] and R[1..n2+1] be new arrays*/
	n=5
	int B[n]
	B[0]=0
	B[1]=8
	B[2]=6
	B[3]=9
	B[4]=2
	
	//while (i<n){
	//B[i]=read()
	//i=i+1}
	//INSERTIONSORT(B[n])
	return MERGESORT(B, 0, 8)
}