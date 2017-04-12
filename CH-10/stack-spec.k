module STACK-SPEC
imports ALG2
rule 
<k>
(
PUSH(&S, M:Int)
Pop(&S)
=>
.K)
...
</k>
<tid>_=>_</tid>
<fid>_=>_</fid>
<env>
ENV:Map
</env>
<store>
STORE:Map
</store>
<tenv>
TENV:Map
</tenv>
 <funs>  
 FUNS:Bag
 </funs>
<stacks>
STACKS:Bag=>Q':Bag
</stacks>
<time>T:Int=>T+Int 2</time>

 
  endmodule