module RANDOM-HIRE-SPEC
imports ALG4

rule
<k>
 while (i<=n){
 //for i=1 to n{
  //score(i)=s;
  if score(i)>score(best)
 		best=i;
 // return (best)};
  i=i+1
  }
=>
.K
...
</k>
<env>
...
i|-> tv(int, LI:Int)
n|->tv(int, LN:Int)
best|->tv(int, LB:Int)
...
</env>
<store>
...
LI|-> (tv(int, I:Int)=>tv(int, N+Int 1))
LN|-> tv(int, N:Int)
LB|->(tv(int, B:Int)=>tv(int, ?B1:Int))
...
</store>

 <time>T:Int=>T1</time>
 requires I<=Int (N+Int 1)
 
 
 
rule 
//<thread>
<k>
(RANDOMIZEHIREASSISTANT(tv(int, M:Int))
=>
tv(int, ?N1:Int))
...
</k>
//...
//</thread>
//<struct>... STRUCT:Map ...</struct>
<fun> 
...
 FUN:Map
 ...
 </fun>
 <store>
 STORE:Map=>M1:Map
 </store>
  <nextLoc>N:Int=>N':Int</nextLoc>
<time>T:Int=>T1</time>
//requires  M>=Int 0

//ensures T1-Int T<=Int (2^Int M)

 endmodule