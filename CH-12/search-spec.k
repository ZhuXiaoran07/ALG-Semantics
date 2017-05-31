module TREE-SPEC
imports ALG4


rule
<k>
TREESEARCH(tv(struct treeNode, object(I1)),tv(int, I2))
=>
tv(T:Type, ?I3:Value)
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
ensures T1>Int T2

 endmodule