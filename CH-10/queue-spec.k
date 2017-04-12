



module QUEUE-SPEC
imports ALG2
rule 
<k>
ENQUEUE(Q, M:Int)
DEQUEUE(Q)
=>
.K
...
</k>
<env>

ENV:Map=>.Map
</env>
<store>
STORE:Map=>.Map
</store>
<tid>_=>.K</tid>
<fid>_=>.K</fid>
 <funs> 
 FUNS:Bag
 </funs>
 <queue>
 <queueId> Q </queueId>
 <queueStore> L1:List=>?L2:List </queueStore>
 <queueLen> N1:Int=>?N1':Int </queueLen>
 <head> N2:Int=>N2+Int 1 </head>
 <tail> N3:Int=>N3+Int 1 </tail>
 </queue> 
 <time>T:Int=>T+Int 2</time>
 
  endmodule