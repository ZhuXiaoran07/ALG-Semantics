module FIB-SPEC
imports ALG1
rule 
<k>
(FIB(M:Int)
=>
?N1:Int)
...
</k>

<funs> 
 FUNS:Bag
 </funs>
<time>T:Int=>T1</time>
requires  M>=Int 0

//ensures T1-Int T<=Int (2^Int M)

 endmodule