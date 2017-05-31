//P788
//change:parallel to spawn
int RACEEXAMPLE(int x)

spawn {int i;
i=1;
while i<=2{
	x=(x+1);
	i=(i+1)
}};
print(x);
return;
/*parallel for i=1 to 2
	x=x+1
print(x)*/

main(){
	RACEEXAMPLE(0)
}