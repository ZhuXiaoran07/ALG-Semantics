module TREE-SPEC
imports ALG4


 
 rule
<k>
INORDERTREEWALK(&tv(struct treeNode, object(I1)))
=>
.K
...
</k>

<env>
ENV:Map
</env>
<store>
STORE:Map=>M1:Map
</store>
 <struct>... STRUCT:Map ...</struct>
<fun> 
 ...
 FUN:Map
 ...
 </fun>
 <nextLoc>N:Int=>N':Int</nextLoc>
<time>T2:Int=>T1:Int</time> 
ensures T1-Int T2 >Int 0

 endmodule