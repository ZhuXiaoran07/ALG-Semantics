//P152

void PARENT(i)
 return i/2

|

void LEFT(i)
 return 2*i

 |
 
void RIGHT(i)
 return 2*i+1

|

void MAXHEAPIFY(A,i)
 l=LEFT(i)
 r=RIGHT(i)
 if l<=A.heapsize and A[l]>A[i]
 largest=l
 else largest=i
 if r<=A.heapsize and A[r]>A[largest]
 largest=r
 if largest!=i{
 exchange A[i] with A[largest]
 MAXHEAPIFY(A, largest)}

|

main(){
	n=5
	int B[n]
	B[0]=0
	B[1]=8
	B[2]=6
	B[3]=9
	B[4]=2
	return MAXHEAPIFY(B, 2)
}
