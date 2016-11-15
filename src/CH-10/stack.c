//P 233
// some error

STACK-EMPTY(S)
1 if S.top==0{
2	return TRUE}
3 else{return FALSE}

PUSH(S,x)
1 S.top=S.top+1
2 S[S.top]=x

Pop(S)
1 if STACK-EMPTY(S){
2 	error "underflow"}
3 else{S.top=S.top-1
4	 return S[S.top+1]}
