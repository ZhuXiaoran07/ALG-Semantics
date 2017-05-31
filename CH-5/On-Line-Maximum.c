//P140
int ONLINEMAXIMUM(int k,int n)
int bestscore;
bestscore=-1;
int i;
i=1;
while (i<k){
//for i=1 to k
	if score(i)>bestscore
		bestscore=score(i);
i=i+1};
i=k+1;
while (i<n){
//for i=k+1 to n
	if score(i)>bestscore
		return (i);
i=i+1};
return (n)

		
main()
{
	//int m;
	//int n
	//m=5;
	ONLINEMAXIMUM(5, 10);
	return (0)
}