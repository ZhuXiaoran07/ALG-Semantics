module ALG1-SYNTAX

syntax MainId ::= "main"   [token]

	syntax ReturnVal::=Int | Id
 	
	syntax Symbol::= FunctionCall
				> Int | String | Id 
 syntax AExp  ::=   String | "read" "(" ")"  
				 >  AriExp "mod" AriExp              [left, seqstrict]
				 >  AriExp "-" AriExp              [left, seqstrict]
				 |AriExp "+" AriExp              [left, seqstrict]
				| AriExp "=" AriExp                [strict(2)]
				
syntax BExp  ::= Bool 
				// | Symbol "<" Symbol
				 | AriExp "!=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				  | AriExp "==" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp ">" AriExp             [seqstrict, latex({#1}\leq{#2})]
				  | AriExp "<=" AriExp             [seqstrict, latex({#1}\leq{#2})]

  syntax Block ::="{" Stmts "}"
  syntax Stmt  ::= Block 
				  | AExp
				// | BExp  
				 | FunctionCall 
				 | Type Id
				 | "if"  BExp Stmt "else" Stmt         [strict(1)]
				 | "return" "("Id "(" AriExp")"")"  [seqstrict(2)]
				 | "return" "(" ReturnVal ")" [strict]
				  | "return" "(" AExp ")" [seqstrict]

				
			 

 syntax Stmts ::= List{Stmt,""}
   syntax Ids   ::= List{Id,","}
syntax AriExp::=AExp | Symbol
syntax AriExps::=List{AriExp, ","}
syntax FunctionDef::= Type FunctionCall
syntax Type::="int" | "void" | "bool"
syntax Param::=AriExp
syntax Params::=List{Param, ","}
//syntax FunctionCall::= Id "(" AriExps ")"  //[seqstrict(2)]
syntax FunctionCall::= Id "(" AriExp")" [seqstrict(2)]					 

syntax Sep::= "|"
	syntax MainPgm::=MainId "(" ")" Block	
syntax FunPgm::=FunctionDef Stmts
syntax FunPgms::=List{FunPgm, ""}
syntax Pgm ::= FunPgm Sep MainPgm

syntax Id::="a"   [token]
		   | "b"  [token]
		   | "t"   [token]
		   | "m"  [token]
		   | "n"  [token]
		   | "GCD" [token]
		   | "EUCLID" [token]
		   | "FIB"   [token]
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
  // <fid>.K</fid>
  <tid>.K</tid>
  //array
     //object  
	  //functionCall
	  <funs>
	  <fun multiplicity="*">
	  <fun-id> .K</fun-id>
	  <funBody>.Stmts</funBody>
	  <para>.K</para>
	//  <returns>.K</returns>
	  </fun>
	  </funs>
	   <fstack color="blue"> .List </fstack>
	  //global
	  <store>.Map</store>
	  <genv> .Map </genv>
       //Standard input and output
	   <in color="magenta" stream="stdin"> .List </in>
       <out color="Orchid" stream="stdout"> .List </out> 
		<time>0</time>
		 
                </T>
  

syntax KItem ::= mkDecls(AriExps,AriExps)  [function]

  rule mkDecls((X:AriExp, Ps:AriExps), (V:AriExp, Vs:AriExps))
    => X=V~> mkDecls(Ps,Vs)
	
  rule mkDecls(.AriExps,.AriExps) => .K

  rule <k>X:Id=>I:Int...</k>
	   <env>...X|->N...</env>
	   <store>...N|->I...</store>
  
 rule <k> int X:Id=>. ...</k>
        <env> Rho => Rho[X <- !N:Int] </env>
       <store>... .Map => !N |-> 0 ...</store>
	
 /*  rule <k>X:Id=>?N1:Int...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	   <store>M:Map=>M[!N<-?N1:Int]</store>	
	   when notBool (X in keys(Rho))*/
	   
 
  rule I1 - I2 => I1 -Int I2
  rule I1 + I2 => I1 +Int I2
  rule I1 mod I2 => I1 %Int I2
  
  rule <k> X:Id = I:Int => .K ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> (_ => I) ...</store>
         
	  
 /*rule <k>	X:Id = I:Int =>I; ...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	  <store>M:Map=>M[!N<-I]</store>
	   when notBool (X in keys(Rho))*/
	   
   rule <k> read() => I ...</k>
     <in> (ListItem(I:Int) => .List) ...</in>  
	 [read]
	   
// BExp
 
  rule I1 != I2 => I1 =/=Int I2
 rule I1 == I2 => I1 ==Int I2
  rule I1 > I2 => I1 >Int I2
   rule I1 <= I2 => I1 <=Int I2

  
  
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

rule <k>(T:Type F:Id(A1:AriExp) Ss:Stmts |F1:MainId() B:Block=>F1:MainId() B:Block)</k>
     <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>A1</para></fun>)</funs>
	requires F=/=K main
	

rule <k> F:MainId() B:Block=>B ...</k>
     <tid>_=>F</tid>
    requires F==K main
	

rule .FunPgms=>.
rule .AriExps=>.

	
// Function Call

syntax KItem::="(" Map "," Map "," K ")"



	rule <k>((F1:Id(A1:Int)~>K) =>int P1~>P1=A1~>Ss)</k>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
      <fstack> .List => ListItem((Env, STORE, K)) ... </fstack>
	 <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> Ss:Stmts</funBody><para>P1:Id</para></fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map=>.Map</store>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main
	
	/*	rule <k>((F1:Id(A1:Int)~>K) =>int P1~>P1=A1~>Ss~>K1)</k>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
      <fstack> ListItem((Env1, STORE1, K1)) => ListItem((Env, STORE, K)) </fstack>
	 <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> Ss:Stmts</funBody><para>P1:Id</para></fun>
	 <env> Env:Map=>Env1 </env>
	 <store> STORE:Map=>STORE1</store>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main*/
	
	
/*	rule <k>(return (F1:Id(Vs:AriExps))=>mkDecls(Ps, Vs)~>B)...</k>
		 <tid>F</tid>
	 <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps</para></fun>
	 <env> Env:Map </env>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main*/

rule <k>(return (F1:Id(A1:Int)))~>_=>F1:Id(A1)~>K</k>
<env>_=>Env</env>
<store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE, K)) => .List ...</fstack>
	

	syntax KItem::="tv" "(" Int")" 
				  | "tv" "(" Id ")"
	
rule <k>(return (I:Int))~>_ =>I~>K</k>
    // <fid>F</fid>
	 <env>_=>Env</env>
	 <store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE, K)) => .List ...</fstack>
    
	 
rule <k>tv(I:Id)=> .K ... </k>
     <tid>_=>.K</tid>
	// <fid>_=>.K </fid>
	 <env>M:Map=>.Map</env>
	 <store>M1:Map=>.Map</store>
	//  <fstack> _:List => .List</fstack>

endmodule
