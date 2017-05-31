//require "./alg.k"
require "./alg-configuration.k"
require "alg-syntax.k"

module ALG
  imports ALG-SYNTAX
  imports ALG-CONFIGURATION
  
  syntax KItem ::="["Id "," Int "]"
//syntax KItem ::= "value-array" "("  Int  ")"

syntax KItem::=  "update" "(" Id "," Int "," Int ")"
			   | lambda(Type, Params, Stmts)
syntax Map::=	"array-map" "(" Int "," Int ")"  [function]

syntax Stmts ::= mkDecls(AriExps,AriExps)  [function]
  rule mkDecls((X:AriExp, Ps:AriExps), (V:AriExp, Vs:AriExps))
    => X=V~> mkDecls(Ps,Vs)
  rule mkDecls(.AriExps,.AriExps) => .
 

//rule X:Id[I:Int]=>?_:Int
 


 
 /*rule <k> X:Id[I:Int]=>?I1:Int...</k>
     <arrayStore> ...<array>
				  <arrayId> X:Id </arrayId>
				   <arrayType> _ </arrayType>
				  <arraystore>M:Map=>(M value-array(I)|->?I1) </arraystore>
				  </array>  </arrayStore>
				  
//How to check the existence of a bag
 rule <k>X:Id[I:Int]=> ?N1:Int...</k>
 <arrayStore> AS:Bag=>
				  (AS <array> <arrayId> X:Id </arrayId>
				   <arrayType> .K </arrayType>
				  <arraystore> value-array(I)|->?N1 </arraystore>
				  </array>)  </arrayStore>*/
				  

 //array

// AExp
rule array-map(I, L)=>(L-Int 1|->?_:Int) array-map(I, L-Int 1)
requires L>Int 0

rule array-map(I, 0)=>.Map
//rule int X:Id[I:Int]=>.K
rule <k> (int X:Id[I:Int]=>[X,I]) ...</k>
     <env>M:Map</env>
	 when notBool(I in keys(M)) 

 rule <k>(int X:Id[I:Id]=> [X, I']) ...</k>
 <env>...I|->N...</env>
 <store>...N|->I':Int...</store>
 
rule <k> ([X, I:Int]=>.) ...</k>
 <arrayStore> AE:Bag=>AE <array>
				  <arrayId> X:Id </arrayId>
				   <arrayType> .K </arrayType>
				  <arraystore> array-map(I,I) </arraystore>
				  <arrayLen>I</arrayLen>
				  </array>  </arrayStore>
//<time> T=>T+Int 1 </time>

rule X:Id[I1:Int]=I2:Int=>update(X,I1,I2)



//rule X:Id[I]=>I
rule <k> (X:Id[I:Int]=>I1:Int)...</k>
     <arrayStore> ...<array>
				  <arrayId> X:Id </arrayId>
				  // <arrayType> _ </arrayType>
				  <arraystore> ... I|->I1 ...</arraystore>
				  ...
				  </array>...  </arrayStore>

rule <k>update(X,I1,I2)=>I2; ...</k>
<arrayStore>      <array>
				  <arrayId> X:Id </arrayId>
				  <arrayType> .K </arrayType>
				  <arraystore>... (I1:Int)|->(_=>I2:Int) ...</arraystore>
				  ...</array>
				  ...
				  </arrayStore>
//<store> ... value-array(X, I1)|->(_=>I2)...</store>
<time> T=>T+Int 1 </time>


/*rule <k>(X:Id[I1]=>I2:Int)...</k>
//<env>...X|->I...</env>
<arrayStore>
		 <arrayId> X:Id </arrayId>
		 <arrayType> _ </arrayType>
		<arraystore>... value-array(I1)|->I2 ...</arraystore>
				  </arrayStore>*/

  
  
  //AExp
  rule <k>(I1:Id, I2:Id, I3:Id)=F:Id(I5:Id, I6:Id, I7:Id)=>. ...</k>
 /* rule <k>(I1:Id, I2:Id, I3:Id)=F:Id(I5:Id, I6:Id, I7:Id) =>I1=A1~>I2=A2~>I3=A3 ...</k>
  <fun> <fun-id>F</fun-id><returns> (A1, A2, A3) </returns>...</fun>*/
  
  rule INFINITY=>100000
  rule <k>X:Id=>I:Int...</k>
	   <env>...X|->N...</env>
	   <store>...N|->I...</store>
  
   rule <k>X.length:SizeId=>I:Int...</k>
	    <array> <arrayId>X</arrayId> <arrayLen>I:Int</arrayLen>...
		</array>
	
   rule <k>X:Id=>?N1:Int...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	   <store>M:Map=>M[!N<-?N1:Int]</store>	
	   when notBool (X in keys(Rho))
	
  rule I1 / I2 => I1 /Int I2  requires I2 =/=Int 0
  //rule I1 % I2 => I1 %Int I2 requires I2=/=Int 0
  rule I1 * I2 => I1 *Int I2 
  rule I1 - I2 => I1 -Int I2
    rule I1 mod I2=>I1 %Int I2   requires I2=/=Int 0
  rule I1 + I2 => I1 +Int I2
  rule Str1 + Str2 => Str1 +String Str2
  
  rule <k> X:Id = I:Int => I; ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> (_ => I) ...</store>  
	  
  rule <k>	X:Id = I:Int =>I; ...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	  <store>M:Map=>M[!N<-I]</store>
	   when notBool (X in keys(Rho))
	   
   rule <k> read() => I ...</k>
     <in> (ListItem(I:Int) => .List) ...</in>  
	 [read]
	   
// BExp
  rule I1 <= I2 => I1 <=Int I2
  rule I1 < I2 => I1 <Int I2
  rule I1 == I2 => I1 ==Int I2
  rule I1 != I2 => I1 =/=Int I2
  rule I1 <= I2 <= I3 => (I1<=Int I2) andBool (I2 <=Int I3)
  rule I1 >= I2 => I1 >=Int I2
  rule I1 > I2 => I1 >Int I2

   rule B:Bool == TRUE => B ==Bool true
  rule B:Bool == FALSE => B==Bool false
  rule ! T => notBool T
  rule not B:Bool => notBool B
  rule B1:Bool and B2:Bool => B1 andBool B2
  rule B1:Bool or B2:Bool => B1 orBool B2
  rule true and B => B
  rule false and _ => false	
  
  
 //Stmt
 syntax KItem::= Int ";"
 rule  _:Int; => .
 /*rule <k> X:AriExp = I:Int => I; ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> (_ => I) ...</store> 
		<time> M=>M+Int 1 </time>[assignment]*/
  rule if true  S else _ => S
  rule if false _ else S => S
  rule if true S => S
  rule if false _=> .Stmts
 // rule while I<N1 {S:Stmts} => .   
  rule while B S => if B {S while B S} else {.Stmts}  [structural]
   rule <k> {Ss:Stmts} => Ss ...</k>   [structural]
  // Stmts
  rule .Stmts => .                 [structural]
  rule S:Stmt Ss:Stmts => S ~> Ss  [structural]
  rule let I1:Id[1 .. N1+1] and I2:Id[1 .. N2+1] be new arrays => int I1[N1]~> int I2[N2]           [structural]
  //rule S:Stmt S1:Stmt => S ~> S1  [structural]
  //rule for I:Id=N:Int to N1:Int {Ss:Stmts}=>(I=N) ~> while I<N1 {Ss~>I=(I+1)}  [structural]
  
  //rule for I:Id=N:Int to N1:Int {Ss:Stmts}=> for (I=N I<N1 I=(I+1)){Ss}
   
   //rule for(St1:Stmt B:BExp St2:Stmt){Ss}=>St1~> {while B {Ss St2}}
  
 // rule for(St1:Stmt B:BExp St2:Stmt){Ss}=>St1~>Ss[structural]
  
/*rule <k> int (X,Xs => Xs); ...</k>
       <env> Rho => Rho[X <- !N:Int] </env>
       <store>... .Map => !N |-> 0 ...</store>
	   <time> M=>M+Int 1 </time>
  rule int .Ids; => .  [structural]*/

//functionDefinition  

rule <k>(T:Type F:Id(Ps:AriExps) Ss:Stmts |F1:MainId(Is:Ids) B:Block=>F1:MainId(Is:Ids) B:Block) </k>
     <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns> .K </returns></fun>)</funs>
	requires F=/=K main
	
rule E:Sep => .

rule <k> F:MainId(Is:Ids) B:Block=>B </k>
     <tid>_=>F</tid>
	 //<store>... .Map=>!LI:Int|->?_:Int...</store>
	<funs> (FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> B</funBody><para>Is</para><returns> .K </returns></fun>)</funs>	
	requires F==K main
	
	
/*rule <k> lambda(T,Ps,S)(Vs:Vals) ~> K => mkDecls(Ps,Vs) S return; </k>
       <control>
         <fstack> .List => ListItem((T',Env,K,C)) ...</fstack>
         <return> T' => T </return>
         C
       </control>
       <env> Env => GEnv </env>
       <genv> GEnv </genv>*/

/*rule <k>(T:Type F:Id (I1, I2, I3) Ss:Stmts  FP:FunPgm | MP:MainPgm  =>FP | MP) </k>
	 <tid>_=>F</tid>
	// <store>... .Map=>!LI:Int|->?_:Int...</store>
	<funs> (FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>(I1, I2, I3)</para><returns> .K </returns></fun>)</funs>
	requires F=/=K main

rule <k>(T:Type F:Id (I1, I2, I3, I4) Ss:Stmts | F1:MainId(Is:Ids) B:Block=>F1:MainId(Is:Ids) B:Block)</k>
	 <tid>_=>F</tid>
	// <store>... .Map=>!LI:Int|->?_:Int...</store>
	<funs> (FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>(I1, I2, I3, I4)</para><returns> .K </returns></fun>)</funs>
	requires F=/=K main*/
rule .FunPgms=>.
rule .AriExps=>.

/*rule <k>(T:Type F:Id (I1, I2) Ss:Stmts | MG:MainPgm=>MG) </k>
	 <tid>_=>F</tid>
	// <store>... .Map=>!LI:Int|->?_:Int...</store>
	<funs> (FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>(I1, I2)</para><returns> .K </returns></fun>)</funs>
	requires F=/=K main*/
	
// Function Call

syntax KItem ::= env(Map)
  rule <k> env(Env) => . ...</k>  <env> _ => Env </env>  [structural]
  rule (env(_) => .) ~> env(_)  [structural]

  syntax KItem ::=(Map,K)


	rule <k>(F1:Id(Vs:AriExps)~>K =>mkDecls(Ps, Vs)~>B) </k>
	<fstack> L:List(.List=> ListItem((Env, K))) </fstack>
     <tid>F</tid>
	 <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps</para><returns> .K </returns></fun>
	 <env> Env:Map </env>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main
	
	rule return (F1:Id(Vs:AriExps)~>K)=>F1:Id(Vs:AriExps)~>K
	
	//rule {} => .  [structural]
  rule <k> { S:Stmts } => S ~> env(Env) ...</k>  <env> Env </env>  [structural]
  
	  syntax KItem ::= env(Map)
  rule <k> env(Env) => . ...</k>  <env> _ => Env </env>  [structural]
  rule (env(_) => .) ~> env(_)  [structural]
	
syntax KItem::="MatchVP2" "(" Int "," Int "," Id "," Id ")" 
				  | "MatchVP1" "(" Int "," Id ")"
				  | "MatchAP2" "(" AriExp "," AriExp "," Id "," Id ")" 
				  | "MatchAP1" "(" AriExp "," Id ")"
				  | "MatchAP3" "(" AriExp "," AriExp "," AriExp "," Id "," Id "," Id ")" 
	
/*		//rule matchVP(Ins:Ints,Is:Ids)=>
	
	rule <k>MatchVP2(N1:Int, N2:Int, I1:Id, I2:Id)=>MatchVP1(N2, I2)...</k>
	    <env> M:Map=>(M I1|->?LI1:Int)</env>
		<store>M1:Map=>(M1 ?LI1|->N1)</store>
		
rule <k>MatchVP1(N1:Int, I1:Id)=>. ...</k>
	    <env> M:Map=>(M I1|->?LI1:Int)</env>
		<store>M1:Map=>(M1 ?LI1|->N1)</store>		

rule MatchAP1(A:AriExp, I:Id)=>I=A
rule MatchAP2(A1:AriExp, A2:AriExp, I1:Id, I2:Id)=>I1=A1~>I2=A2
rule MatchAP3(A1:AriExp, A2:AriExp, A3:AriExp, I1:Id, I2:Id, I3:Id)=>I1=A1~>I2=A2~>I3=A3
		
rule <k>(F1:Id (N1:Int, N2:Int)=>MatchVP2(N1, N2, I1, I2)~>B) ...</k>
     <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I1:Id, I2:Id)</para><returns> .K </returns></fun>
	
	requires F==K main

	
	
 //return & functionCall
 
 rule <k> F1:Id (I:Id, I2, I3, I4)=>MatchAP3(I2, I3, I4, I5, I6, I7)~>B ...</k>
 <fid>_=>F1</fid>
      <tid>F</tid>
	   <array> <arrayId>I=>I0</arrayId>...  </array>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I0, I5, I6, I7)</para><returns> .K </returns></fun>
	requires F==K main
 
 rule <k> F1:Id (I:Id, I2, I3)=>MatchAP2(I2, I3, I4, I5)~>B ...</k>
 <fid>_=>F1</fid>
      <tid>F</tid>
	   <array> <arrayId>I=>I0</arrayId>...  </array>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I0, I4, I5)</para><returns> .K </returns></fun>
	requires F==K main
	  
 
  rule <k> F1:Id (I:Id, N1:Int, N2:Int)=>MatchVP2(N1, N2, I1, I2)~>B ...</k>
  <fid>_=>F1</fid>
  <array> <arrayId>I=>I0</arrayId>...  </array>
	 <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I0, I1, I2)</para><returns> .K </returns></fun>
	requires F==K main
	
 /*rule <k> F1:Id (I:Id, N1:Int, N2:Int, N3:Int)=>MatchVP2(N1, N2, I1, I2)~>B ...</k>
  <array> <arrayId>I=>I0</arrayId>...  </array>
	 <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I0, I1, I2)</para><returns> .K </returns></fun>
	requires F==K main*/
 
/* rule <k> return F1:Id (I:Id, N1:Int, N2:Int)=>MatchVP2(N1, N2, I1, I2)~>B ...</k>
 <fid>_=>F1</fid>
  <array> <arrayId>I=>I0</arrayId>...  </array>
	 <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I0, I1, I2)</para><returns> .K </returns></fun>
	
	requires F==K main
 
 
 
rule <k> return F1:Id (N1:Int, N2:Int)=>MatchVP2(N1, N2, I1, I2)~>B ...</k>
<fid>_=>F1</fid>
	 <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I1, I2)</para><returns> .K </returns></fun>
	
	requires F==K main
	
rule <k> return F1:Id (I:Id)=>B ...</k>
     <fid>_=>F1</fid>
     <array> <arrayId>I=>I1</arrayId>...  </array>
	 <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>I1:Id</para><returns> .K </returns></fun>
	
	requires F==K main
	

rule <k> return F1:Id (I:Id)=>B ...</k>
     <fid>_=>F1</fid>
     <array> <arrayId>I=>I1</arrayId>...  </array>
	 <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>I1:Id</para><returns> .K </returns></fun>
	requires F==K main	
	
	
  
rule <k> return F1:Id (A1:AriExp, A2:AriExp)=>MatchAP2(A1, A2, I1, I2)~>B ...</k>
     <fid>_=>F1</fid>
     <tid>F</tid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(I1, I2)</para><returns> .K </returns></fun>  
	 requires F==K main*/
	 
rule <k> return (A1:AriExp, A2:AriExp, A3:AriExp)=>. ...</k>
<fid>F1</fid>
<fun> <fun-id>F1</fun-id> <returns> (A1, A2, A3) </returns>...</fun>
	 
	
rule <k>return I:Id =>I1; ...</k>
     <tid>F</tid>
	 <env>...I|->LI...</env>
	 <store>...LI|->I1:Int ...</store>
     <fun>...<fun-id>F</fun-id>
	 <returns>_=>I1 </returns> ...</fun>
//rule <k> (F:Id(As:AriExps))=>. ...</k>

/*rule <k>return .AriExps=>. ...</k>
     <tid>F</tid>
	 requires F==K main*/
endmodule
