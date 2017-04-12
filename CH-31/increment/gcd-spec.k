module GCD-SPEC
imports ALG1
rule 
<k>
(GCD(m , n)
=>
.K)
...
</k>

<env>

(m|->LM:Int
n|->LN:Int)=>?M1:Map
</env>
<store>
(LM|->A:Int
LN|->B:Int)=>?M2:Map
 </store>
/*<env>

ENV:Map=>?M1:Map
</env>
<store>
STORE:Map=>?M2:Map
</store>*/
<tid>_:Id=>.K</tid>
<fid>_:Id=>.K</fid>
 <funs> 

 FUNS:Bag
 </funs>
<time>T:Int=>T1:Int</time>
requires  (A>Int 0 andBool B>Int 0)
ensures (T1-Int T<=Int A+Int B)


 endmodule