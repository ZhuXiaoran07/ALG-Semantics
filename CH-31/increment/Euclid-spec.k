module EUCLID-SPEC
imports ALG1
rule 
<k>
(EUCLID(m,n)
=>
.K)
...
</k>
<env>

(m|->LA:Int
n|->LB:Int
)=>.Map
</env>
<store>
(LA|->(A:Int)
LB|->(B:Int)
)=>.Map
</store>
<tid>_=>.K</tid>
<fid>_=>.K</fid>
 <funs> 
 FUNS:Bag
 </funs>
<time>T:Int=>?T1:Int</time>
requires A>Int 5 andBool B>Int 5 andBool A<=Int 100 andBool B<=Int 100
ensures ?T1 -Int T <=Int A


 endmodule