module ALG1-SYNTAX

syntax MainId ::= "main"   [token]

syntax Id::=MainId	
 	
	syntax Symbol::= FunctionCall
				> Int | String | Id 
 syntax AExp  ::=   String | "read" "(" ")"  
				 >  AriExp "mod" AriExp              [left, seqstrict]
				 >  AriExp "-" AriExp              [left, seqstrict]
				| AriExp "=" AriExp                [strict(2)]
				
syntax BExp  ::= Bool 
				// | Symbol "<" Symbol
				 | AriExp "!=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				  | AriExp "==" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp ">" AriExp             [seqstrict, latex({#1}\leq{#2})]

  syntax Block ::="{" Stmts "}"
  syntax Stmt  ::= Block 
				  | AExp
				// | BExp  
				 | FunctionCall 
				 | "if"  BExp Stmt "else" Stmt         [strict(1)]
				 | "return" "("Id")"       // [seqstrict]	
				 | "return" "("Int ")"
				 | "return" "("Id "(" AriExp"," AriExp ")"")" [strict(2,3)]

				
			 
syntax Ints   ::= List{Int,","}
 syntax Stmts ::= List{Stmt,""}
   syntax Ids   ::= List{Id,","}
syntax AriExp::=AExp | Symbol
syntax AriExps::=List{AriExp, ","}
syntax FunctionDef::= Type FunctionCall
syntax Type::="int" | "void" | "bool"
syntax Param::=AriExp
syntax Params::=List{Param, ","}
syntax FunctionCall::= Id "(" AriExp"," AriExp ")" [strict(2,3)]
//syntax FunctionCall::= Id "(" AriExps")" [seqstrict(2)]					 

syntax Sep::= "|"
	syntax MainPgm::=MainId "("Params")" Block	
syntax FunPgm::=FunctionDef Stmts
syntax FunPgms::=List{FunPgm, ""}
syntax Pgm ::= FunPgms Sep MainPgm

syntax Id::="a"   [token]
		   | "b"  [token]
		   | "t"   [token]
		   | "m"  [token]
		   | "n"  [token]
		   | "GCD" [token]
		   | "EUCLID" [token]
		      | "x" [token]
		   | "y" [token]
		  // | "main" [token]
				  
endmodule



module ALG1
  imports ALG1-SYNTAX
 // imports ALG-CONFIGURATION
   syntax KResult ::= Int | Bool | String

  
  configuration <T color="yellow">
  // thread
 
  <k> $PGM:Pgm</k>
  <env>.Map</env>
   <fid>.K</fid>
  <tid>.K</tid>
  //array
     //object  
	  //functionCall
	  <funs>
	  <fun multiplicity="*">
	  <fun-id> .K</fun-id>
	  <funBody>.Stmts</funBody>
	  <para>.AriExps</para>
	//  <returns>.K</returns>
	  </fun>
	  </funs>
	  
	  //global
	  <store>.Map</store>
	  <stack> .List </stack>
	  //<locals> .List </locals>
       //Standard input and output
	   <in color="magenta" stream="stdin"> .List </in>
       <out color="Orchid" stream="stdout"> .List </out> 
		<time>0</time>
		 
                </T>
  
/*rule (A:AriExp, As:AriExps)=>A~>As
rule (.AriExps)=>.
rule I:Int~>As:AriExps=>As~>I
rule I1:Int~>I2:Int=>(I2, I1)*/
syntax Stmts ::= mkDecls(AriExps,AriExps)  [function]

  rule mkDecls((X:AriExp, Ps:AriExps), (V:AriExp, Vs:AriExps))
    => X=V~> mkDecls(Ps,Vs)
	
  rule mkDecls(.AriExps,.AriExps) => .Stmts

  rule <k>X:Id=>I:Int...</k>
	   <env>...X|->N...</env>
	   <store>...N|->I...</store>
  
 
	
 /*  rule <k>X:Id=>?N1:Int...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	   <store>M:Map=>M[!N<-?N1:Int]</store>	
	   when notBool (X in keys(Rho))*/
	   
 
  rule I1 - I2 => I1 -Int I2
  rule I1 mod I2 => I1 %Int I2
  
  rule <k> X:Id = I:Int => I; ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> (_ => I) ...</store>
         
	  
 rule <k>	X:Id = I:Int =>I; ...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	  <store>M:Map=>M[!N<-I]</store>
	 // <locals> ... .List=> ListItem()
	   when notBool (X in keys(Rho))
	   
   rule <k> read() => I ...</k>
     <in> (ListItem(I:Int) => .List) ...</in>  
	 [read]
	   
// BExp
 
  rule I1 != I2 => I1 =/=Int I2
 rule I1 == I2 => I1 ==Int I2
  rule I1 > I2 => I1 >Int I2

  
  
 //Stmt
 syntax KItem::= Int ";"
 rule  _:Int; => .
 
  rule if true  S else _ => S
  rule if false _ else S => S
 
 
   rule <k> {Ss:Stmts} => Ss ...</k>   [structural]
  // Stmts
  rule .Stmts => .                 [structural]
  rule S:Stmt Ss:Stmts => S ~> Ss  [structural]


  
  
//functionDefinition  
rule <k>(T:Type F:Id(A1:AriExp, A2:AriExp) Ss:Stmts |F1:MainId(Is:Ids) B:Block=>F1:MainId(Is:Ids) B:Block)</k>
//rule <k>(T:Type F:Id(A1:AriExp, A2:AriExp) Ss:Stmts |F1:MainId(Is:Ids) B:Block=>F1:MainId(Is:Ids) B:Block)</k>
     <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>(A1, A2)</para></fun>)</funs>
	
	requires F=/=K main
	

rule <k> F:MainId(Is:Ids) B:Block=>B ...</k>
     <tid>_=>F</tid>
	 <fid>_=>F</fid>
    requires F==K main
	

rule .FunPgms=>.
rule .AriExps=>.

	
// Function Call



	rule <k>(F1:Id(A1:Int, A2:Int)~>K =>P1=A1~>P2=A2~>B) </k>
    // <tid>F</tid>
	 <fid>F2:Id=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>(P1, P2)</para></fun>
	 <env> Env:Map=>.Map </env>
	<stack> .List=>ListItem(callStackFrame(K, Env, F2))...</stack>
	//<locals>Locals:List => .List </locals>
	 <time>T:Int=>T+Int 1</time>
	//requires F==K main
	
	rule <k>(return (F1:Id(A1:Int, A2:Int))~>_)=>F1:Id(A1:Int, A2)~>K</k>
	      <stack>
      ListItem(callStackFrame(K, _:Map, _:Id))
    =>
      .List
    ...</stack>
	// <fid>F=>Caller</fid>
		// <tid>F</tid>
	/* <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps</para></fun>
	 <env> Env:Map </env>
	 <time>T:Int=>T+Int 1</time>*/
	//requires F==K main

  syntax Int ::= "callStackFrame""("K"," Map"," Id")" 
	

	syntax KItem::="tv" "(" Int")" 
	
rule <k>return (I:Id)~>_ =>I1~>K~>tv(0)</k>
     <fid>F=>Caller</fid>
	 <env>...I|->LI...</env>
	 <store>...LI|->I1:Int ...</store>
    <stack>
      ListItem(callStackFrame(K, CallerEnv:Map, Caller:Id))
    =>
      .List
    ...</stack>
rule return (I:Int)=>tv(I)	
	
rule <k>tv(I:Int)=> .K ... </k>
     <tid>_=>.K</tid>
	 <fid>_=>.K </fid>
	 <env>M:Map=>.Map</env>
	 <store>M1:Map=>.Map</store>

endmodule
