//P369
int EXTENDEDBOTTOMUPCUTROD(ArrType p, int n)
int r[n+1];
int s[n+1];
// let r[0..n] and s[0..n] be new arrays
 r[0]=0;
 int j;
 int q;
 int i;
 j=1;
 while i<=n{
 //for j=1 to n{
	q=-1;
	i=1;
	while i<=j{
	//for i=1 to j
		if q<p[i]{   //should be q<p[i]+r[j-i]
			q=(p[i]+r[j-i]);
	s[j]=i};
	i=(i+1)};
 	r[j]=q;
	j=(j+1)};
 //return(&r, &s)
 return(&s)

void PRINTCUTRODSOLUTION(ArrType p, int n)
//int r[n+1];
int s[n+1];
//(r,s)=EXTENDEDBOTTOMUPCUTROD(&p,n);
s=EXTENDEDBOTTOMUPCUTROD(&p,n);
while n>0{
	print (s[n]);
	n= (n-s[n])
	};
	return;
	
	 main(){
	 int n;
	n=5;
	int B[n];
	B[0]=0;
	B[1]=2;
	B[2]=6;
	B[3]=8;
	B[4]=9;
  PRINTCUTRODSOLUTION(&B, 4)}
