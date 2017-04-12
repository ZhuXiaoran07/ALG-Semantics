module EUCLID-SPEC
imports ALG1
rule 
<k>
(EUCLID(M:Int, N:Int)
=>
?N1:Int)
...
</k>

 <funs> 
 FUNS:Bag
 </funs>
 
<time>T:Int=>?T1:Int</time>
requires  M>=Int 0 andBool N>=Int 0 andBool M +Int N =/=Int 0
ensures ?T1 >Int T


 endmodule
 
