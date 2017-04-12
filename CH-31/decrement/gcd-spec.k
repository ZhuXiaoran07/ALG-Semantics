module GCD-SPEC
imports ALG2
rule 
<k>
(GCD(m,n)
=>
.K)
...
</k>
<env>
(m|->LA:Int
n|->LB:Int
)=>?M:Map
</env>
<store>
(LA|->(A:Int)
LB|->(B:Int)
)=>?M1:Map
</store>
<tid>_=>.K</tid>
<fid>_=>.K</fid>
 <funs> 
 FUNS:Bag
 </funs>
<time>_=>?T1:Int</time>

requires A>Int 0 andBool B>Int 0 andBool A<=Int 5 andBool B<=Int 5 
ensures ?T1>=Int 0


 endmodule