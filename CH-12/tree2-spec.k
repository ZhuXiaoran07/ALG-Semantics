module TREE-SPEC
imports ALG4


rule 
<k>
TREEDELETE(&tv(struct tree, object(I2:Int)), &tv(struct treeNode, object(I1:Int)))
=>
&tv(T:Type, object(?I3:Int))
...
</k>

<env>
ENV=>M2:Map
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
ensures T1>Int T2
 endmodule