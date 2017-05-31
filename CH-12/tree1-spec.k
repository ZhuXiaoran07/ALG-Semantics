module TREE-SPEC
imports ALG3
rule
<k>
(TREEINSERT(((tree, 0), root|->((node, I2:Int), left|->_:Int right|->_:Int)), ((node, I1:Int), left|->NULL right|->NULL))
=>
((tree, 0), root|->?V:Int))
...
</k>

 <fun> 
 ...
 FUN:Map
 ...
 </fun>
<time>T:Int=>?T1:Int</time>
ensures ?T1-Int T ==Int 1

endmodule