//P 233
// some error

struct Stack{
	int top;
	int leng;
	ArrType data
};


bool STACKEMPTY(struct Stack *S)
 if S.top==0
	return (TRUE)
 else return (FALSE)

void PUSH(struct Stack *S,int x)
 S.top=(S.top+1);
 S.data[S.top]=x;
 return;

int Pop(struct Stack *S)
S.top=(S.top-1);
return (S.data[(S.top+1)])
 
void MULTIPOP(struct Stack * S, int k)
while not STACKEMPTY(&S) and k>0{
	Pop(&S);
	k=(k-1)};
	return;

main()
{
	int x;
	struct Stack *S;
	S.leng=7;
	int data[S.leng];
	S.data=&data;
	PUSH(&S, 2);
	Pop(&S);
	return;
	
}