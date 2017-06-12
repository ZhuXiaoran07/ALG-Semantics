module TREE-SPEC
imports ALG4



rule
<k>
INSERTIONSORT(&tv(ArrType, object(I1:Int)))
=>
.K
...
</k>

<store>
STORE:Map=>M:Map
</store>

<fun> 
 ...
 FUN:Map
 ...
 </fun>
 <nextLoc>N:Int=>N':Int</nextLoc>
<time>T2:Int=>T1:Int</time> 

ensures T1<=Int T2 +Int size(array_size(object(I1)))*Int size(array_size(object(I1))) +Int size(array_size(object(I1))) +Int 2

 endmodule