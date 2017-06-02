module ON-LINE-SPEC
imports ALG4

/*rule
<k>
while (i<k){
//for i=1 to k
//	if score(i)>bestscore
	//	bestscore=score(i);
i=(i+1)}
=>
.K
...
</k>
<env>
...
i|-> tv(int, LI:Int)
k|->tv(int, LK:Int)
//bestscore|->tv(int, LB:Int)
...
</env>
<store>
...
LI|-> (tv(int, I:Int)=>tv(int, ?I1:Int))
LK|-> tv(int, K:Int)
//LB|->(tv(int, B:Int)=>tv(int, ?B1:Int))
...
</store>

 <time>T:Int=>T1</time>*/
 //requires I<=Int K

rule 
<k>
while (i<n){
//for i=k+1 to n
	if score(i)>bestscore
		n=i;
i=(i+1)}

=>
.K
...
</k>
<env>
...
i|-> tv(int, LI:Int)
n|->tv(int, LN:Int)
bestscore|->tv(int, LB:Int)
...
</env>
<store>
...
LI|-> (tv(int, I:Int)=>tv(int, ?I1:Int))
LN|-> (tv(int, N:Int)=>tv(int, ?N1:Int))
LB|->(tv(int, B:Int)=>tv(int, ?B1:Int))
...
</store>

 <time>T:Int=>T1</time>
 requires I<=Int N

rule 
//<thread>
<k>
(ONLINEMAXIMUM(tv(int, I1:Int), tv(int, I2:Int))
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