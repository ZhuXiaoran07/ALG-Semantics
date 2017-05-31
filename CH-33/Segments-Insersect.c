//P1018
int SEGMENTSINSERSECT(int p1,int p2,int p3,int p4)
int d1;
int d2;
int d3;
int d4;
d1=DIRECTION(p3,p4,p1);
d2=DIRECTION(p3,p4,p2);
d3=DIRECTION(p1,p2,p4);
d4=DIRECTION(p1,p2,p4);
if ((d1>0 and d2<0) or (d1<0 and d2>0)) and
	((d3>0 and d4<0) or (d3<0 and d4>0))
	return (TRUE)
elseif d1==0 and ONSEGMENT(p3,p4,p1)
	return (TRUE)
elseif d2==0 and ONSEGMENT(p3,p4,p2)
	return (TRUE)
elseif d3==0 and ONSEGMENT(p1,p2,p3)
	return (TRUE)
elseif d4==0 and ONSEGMENT(p1,p2,p4)
	return (TRUE)
else return (FALSE)

int DIRECTION(int pi,int pj,int pk)
	return ((pk-pi)*(pj-pi))


int ONSEGMENT(int pi,int pj,int pk)
//if min(xi,xj)<=xk<=max(xi,xj) and min(yi,yj)<=yk<=max(yi,yj)
if min(pi,pj)<=pk<=max(pi, pj)
	return (TRUE)
else return (FALSE)

int max(int x, int y)
{
  if (x < y) return (y);
  return (x)
}

int min(int x, int y)
{
  if (x > y) return (y);
  return (x)
}



main(){
	/*n1=10
	n2=8
	let L[1..n1+1] and R[1..n2+1] be new arrays*/
	int n;
	n=5;
	int B[n];
	//int A[n];
	B[0]=0;
	B[1]=8;
	B[2]=6;
	B[3]=9;
	B[4]=2;
	SEGMENTSINSERSECT(B[1], B[2], B[3], B[4]);
	 
	 return (0)
}