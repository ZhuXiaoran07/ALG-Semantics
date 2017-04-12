
module GCD-SPEC
imports ALG1
rule 
<k>
(GCD(M:Int,N:Int)
=>
?N1:Int)
...
</k>

<funs> 
 FUNS:Bag
 </funs>
<time>T:Int=>T1</time>
requires  M>Int 0 andBool N>Int 0 

ensures T1-Int T<=Int M+Int N


 endmodule