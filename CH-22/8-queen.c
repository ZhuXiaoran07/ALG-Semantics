void put(ArrType queen, int n, int max, int sum)
int i;
i=0;
while i<max{
queen[n]=i;
if check(&queen, n) {
 if n==max-1
  show(&queen, max, sum)
 else put(&queen, n+1, max, sum)
 };
i=(i+1)};
 return;
 
int check(ArrType queen, int n)
 int i;
 i=0;
 while i<n{
	 if (queen[i]==queen[n]) or (queen[i]-queen[n]==(n-i) or queen[n]-queen[i]==(n-i))
		 return (FALSE);
	 i=(i+1)
 };
 return (TRUE)
 
 void show(ArrType queen, int max, int sum)
 int i=0;
 while i<max{
	 print("(");
	 print(i);
	 print(",");
	 print(queen[i],")", "\n");
	 i=(i+1)
 };
 return;
 
 main(){
	 int max;
	 max=5;
	 int sum;
	 sum=0;
	 int queen[max];
	 put(&queen, 0, max, sum);
	 return(0)
 }