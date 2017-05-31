module HEIGHT-SPEC
  imports ALG4

rule
  <struct>... STRUCT:Map ...</struct>
  <fun>... FUN:Map ...</fun>
  <k>
    height(tv(struct treeNode , object(TP:Int)))
  =>
    tv(int, ?I:Int)
  ...</k>
  <store>STORE:Map</store> 
  <nextLoc>N:Int=>N':Int</nextLoc>
<time>T2:Int=>T1:Int</time> 
endmodule

