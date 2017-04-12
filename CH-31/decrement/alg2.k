module ALG2-SYNTAX

syntax MainId ::= "main"   [token]

	
 	
	syntax Symbol::= FunctionCall
				> Int | String | Id 
 syntax AExp  ::=   String | "read" "(" ")"  
				 >  AriExp "mod" AriExp              [left, seqstrict]
				 >  AriExp "-" AriExp              [left, seqstrict]
				 | AriExp "+" AriExp                [right, seqstrict]
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
				 | "return" "("AriExps")"

				
			 

 syntax Stmts ::= List{Stmt,""}
   syntax Ids   ::= List{Id,","}
    syntax Ints   ::= List{Int,","}
syntax AriExp::=AExp | Symbol
syntax AriExps::=List{AriExp, ","}
syntax FunctionDef::= Type FunctionCall
syntax Type::="int" | "void" | "bool"
syntax Param::=AriExp
syntax Params::=List{Param, ","}
syntax FunctionCall::= Id "(" AriExps ")"  //[right]
					 

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
		  // | "main" [token]
				  
endmodule



module ALG2
  imports ALG2-SYNTAX
 // imports ALG-CONFIGURATION
   syntax KResult ::= Int | Bool | String

  
  configuration <T color="yellow">
  // thread
  <fid>.K</fid>
  <tid>.K</tid>
  <k> $PGM:Pgm</k>
  <env>.Map</env>
  
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
	  
       //Standard input and output
	   <in color="magenta" stream="stdin"> .List </in>
       <out color="Orchid" stream="stdout"> .List </out> 
		<time>0</time>
		 
                </T>
  

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
	   
 
  rule <k>I1 - I2 => I1 -Int I2 ...</k> <time> I:Int=>I-Int 1</time> <fid> F</fid> when F=/=K main
   rule <k>I1 + I2 => I1 +Int I2 ...</k> <time> I:Int=>I-Int 1</time><fid> F</fid> when F=/=K main
  rule <k>I1 mod I2 => I1 %Int I2 ...</k> <time> I:Int=>I-Int 1</time><fid> F</fid> when F=/=K main
  
   rule <k>I1 - I2 => I1 -Int I2 ...</k>  <fid> F</fid> when F==K main
   rule <k>I1 + I2 => I1 +Int I2 ...</k> <fid> F</fid> when F==K main
  rule <k>I1 mod I2 => I1 %Int I2 ...</k> <fid> F</fid> when F==K main
  
  rule <k> X:Id = I:Int => I; ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> (_ => I) ...</store>
	   <time> I1:Int=>I1-Int 1</time>
	   <fid> F</fid>
	   when F=/=K main
	   
rule <k> X:Id = I:Int => I; ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> (_ => I) ...</store>
	   <fid> F</fid>
	   when F==K main
         
	  
 rule <k>	X:Id = I:Int =>I; ...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	  <store>M:Map=>M[!N<-I]</store>
	  <time> I1:Int=>I1-Int 1</time>
	  <fid> F</fid>
	   when notBool (X in keys(Rho)) andBool F=/=K main
	   
rule <k>	X:Id = I:Int =>I; ...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	  <store>M:Map=>M[!N<-I]</store>
	  <fid> F</fid>
	   when notBool (X in keys(Rho)) andBool F==K main
	   
   rule <k> read() => I ...</k>
     <in> (ListItem(I:Int) => .List) ...</in>  
	 [read]
	   
// BExp
 
  rule <k>I1 != I2 => I1 =/=Int I2 ...</k> <time> I:Int=>I-Int 1</time><fid> F</fid> when F=/=K main
 rule <k>I1 == I2 => I1 ==Int I2 ...</k> <time> I:Int=>I-Int 1</time><fid> F</fid> when F=/=K main
  rule <k>I1 > I2 => I1 >Int I2 ...</k> <time> I:Int=>I-Int 1</time><fid> F</fid> when F=/=K main

  rule <k>I1 != I2 => I1 =/=Int I2 ...</k> <fid> F</fid> when F==K main
 rule <k>I1 == I2 => I1 ==Int I2 ...</k> <fid> F</fid> when F==K main
  rule <k>I1 > I2 => I1 >Int I2 ...</k> <fid> F</fid> when F==K main
  
  
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

rule <k>(T:Type F:Id(Ps:AriExps) Ss:Stmts |F1:MainId(Is:Ids) B:Block=>F1:MainId(Is:Ids) B:Block)</k>
     <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para></fun>)</funs>
	requires F=/=K main
	

rule <k> F:MainId(Is:Ids) B:Block=>B ...</k>
     <tid>_=>F</tid>
	 <fid>_=>F</fid>
    requires F==K main
	

rule .FunPgms=>.
rule .AriExps=>.

	
// Function Call
syntax Int::="sum" "(" AriExps ")" [function]
			 // | "sum" "(" Ints ")"
//rule sum(Is:Ids)=>

rule sum(A,B, As)=>sum(As)+A+B [structural]
//rule sum(A, As)+I=>sum(As)+(A+I)
//rule A+.AriExps=>A
rule <k>sum(.AriExps)+I =>. ...</k>    <time> T:Int=>5 *Int I</time>


	rule <k>(F1:Id(Vs:AriExps) =>sum(Vs)~>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	 <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps</para></fun>
	 <env> Env:Map </env>
	 <time>T:Int=>T+Int 10</time>
	requires F==K main
	
	rule <k>(return (F1:Id(Vs:AriExps))=>sum(Vs)~>mkDecls(Ps, Vs)~>B)...</k>
		 <tid>F</tid>
	 <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps</para></fun>
	 <env> Env:Map </env>
	 //<time>T:Int=>T-Int 1</time>
	requires F==K main


	

	syntax KItem::="tv" "(" Int")" 
	
rule <k>return (I:Id) =>tv(I1) ...</k>
     <fid>F</fid>
	 <env>...I|->LI...</env>
	 <store>...LI|->I1:Int ...</store>
    
	 
rule <k>tv(I:Int)=> .K ... </k>
     <tid>_=>.K</tid>
	 <fid>_=>.K </fid>
	 <env>M:Map=>.Map</env>
	 <store>M1:Map=>.Map</store>

endmodule
