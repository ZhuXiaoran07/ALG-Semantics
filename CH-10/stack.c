//P 233
// some error

bool STACKEMPTY(S)
 if S.top==0
	return TRUE
 else return FALSE
|
void PUSH(S,x)
 S.top=S.top+1
 S[S.top]=x
|
int Pop(S)
S.top=S.top-1
return (S[S.top+1])
 
|

main()
{
	int x
	stack S
	PUSH(&S, 2)
	Pop(&S)
	
}