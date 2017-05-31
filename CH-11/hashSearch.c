//P 271

int HASHSEARCH(ArrType T,int k)
int i;
 i=0;
 int j;
 //j=h(k,i);
 j=(k+i) mod T.length;
 while T[j]!=NIL and i!=(T.length-1){
 //repeat{
  // j=h(k,i);
  j=(k+i) mod T.length;
	if T[j]==k
  		return (j);
    i=i+1};
 //until T[j]==NIL or i==m
 return (NIL)
 
 int HASHINSERT(ArrType T,int k)
 int i;
 i=0;
 int j;
 //j=h(k,i);
 j=(k+i) mod T.length;
 while i!=(T.length-1){
// repeat{
  // j=h(k,i);
  j=(k+i) mod T.length;
	if T[j]==NIL{
		T.length=(T.length+1);
 		T[j]=k;
  		return (j)}
 else i=i+1};
 //until i==m
 print ("hash table overflow");
 return;
 
 //h(k,i)
 
 main(){
	 int n;
	n=5;
	int B[n];
	B[0]=11;
	B[1]=12;
	B[2]=13;
	B[3]=14;
	B[4]=15;
	HASHINSERT(&B,16);
	HASHSEARCH(&B,11)
 }