module TREE-SPEC
imports ALG4
/* rule 
<k>
 (while x!=NIL{
 	y=&x;
 	if z.key<x.key
 		x=&x.left
 	else x=&x.right}
=>
.K)
...
</k>
<env>
...
x|->(tv(T1':Type, object(I1:Int))=>tv(?T1:Type, object(M1:Int)))
y|->(tv(T2':Type, object(I2:Int))=>tv(?T2:Type, object(M2:Int)))
z|->tv(T3':Type, object(I3:Int))
...
</env>

<store>
...
object(I1)|->(key |->I1':MyInt left |->I2':MyInt right |->I3':MyInt p|->I4':MyInt)
object(I2)|->((key |->I4:MyInt left |->I5:MyInt right |->I6:MyInt p|->I6':MyInt))
object(I3)|-> (key |->I7:MyInt left |->I8:MyInt right |->I9:MyInt p|->I9':MyInt)
//object(I2':Int)|->(key |->N3:MyInt left |->object(N1:Int) right |->object(N2:Int) )
//object(I3')|->(key |->I4'':MyInt left |->object(I5'') right |->object(I6'') )
//object(-1)|->(key|->object(-1) left|->object(-1) right|->object(-1))
...
</store>
<time>T:Int=>T1</time>*/
//requires I2'=/=K null andBool I3'=/=K

rule
<k>
TREEINSERT(&tv(struct tree, object(I1:Int)),&tv(struct treeNode, object(I2:Int)))
=>
&tv(T6:Type, object(?I3:Int))
...
</k>
<struct>... STRUCT:Map ...</struct>

<store>
STORE:Map=>M1:Map
</store>

<fun> 
 ...
 FUN:Map
 ...
 </fun>
 <nextLoc>N:Int=>N':Int</nextLoc>
<time>T2:Int=>T1:Int</time> 

ensures T2<Int T1 +Int tree_height(object(I1))

 endmodule