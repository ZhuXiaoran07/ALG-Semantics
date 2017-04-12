module ALG-SYNTAX

syntax MainId ::= "main"   [token]

syntax Id::= "top"	| "tail" | "head" | "length" | "next" | "key" | "prev" | "NIL" | "left" | "right" | "root" | "NULL" | "p"
syntax StruId::=Id"."Id
			  | Id"."Id"."Id
			   | "&" Id
			   | "*" Id
 	
	syntax Symbol::= FunctionCall
				> Int | String | Id | Array |StruId
				
				
	syntax Array::=  Id "[" AExp "]"        [strict(2)]
				|  Id "[" Symbol "]"            //[strict(2)]
				
				
 syntax AExp  ::=   String | "read" "(" ")"  
				 >  AriExp "mod" AriExp              [left, seqstrict]
				 >  AriExp "-" AriExp              [left, seqstrict]
				 | AriExp "+" AriExp              [left, seqstrict]
			//	 | Id "=" StruId
				 | AriExp "=" AriExp                [strict(2)]
				//| Array "=" AriExp                [strict(2)]
				
				
syntax BExp  ::= Bool 
				// | Symbol "<" Symbol
				 | AriExp "!=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				  | AriExp "==" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp ">" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "<" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | BExp "and" BExp      [left, strict(1)]
				 | BExp "or" BExp       [left, strict(1)]

  syntax Block ::="{" Stmts "}"
  syntax Stmt  ::= Block 
				  | AExp
				  | "error" "("String")"
				  | "print" "(" AriExps ")" [strict(1)]
				// | BExp  
				 | FunctionCall 
				
				 | Type Id
				// | "struct" Id "{"VariableDeclarations"}" ";"
				 
				 | "int" Id"["Symbol"]"
				 | "if"  BExp Stmt "else" Stmt      [strict(1)]
				 | "if"  BExp Stmt       [strict(1)]
				  | "if"  BExp Stmt "elseif" BExp Stmt "else" Stmt      [strict(1)]
				 | "while" BExp Stmt
				 | "return" "("AriExps")" 
				 

	syntax Bool ::= "TRUE" | "FALSE"			
//	syntax VariableDeclaration ::= Type Id ";"
  //syntax VariableDeclarations ::= List{VariableDeclaration, ""}		[klabel(_VariableDeclarations_)] 
	
 syntax Stmts ::= List{Stmt,""}
   syntax Ids   ::= List{Id,","}
syntax AriExp::=AExp | Symbol
syntax AriExps::=List{AriExp, ","}
syntax FunctionDef::= Type FunctionCall
syntax Type::="int" | "void" | "bool" | "stack" | "queue" | "list" | "node" | "tree"  | "struct"
//syntax Param::=Type Id
//syntax Params::=List{Param, " "}
syntax FunctionCall::= Id "(" AriExps ")"  //[seqstrict(2)]
 syntax StructDeclaration ::= "struct" Id "{" Stmts "}" ";"					 

syntax Sep::= "|"
	syntax MainPgm::=MainId "("AriExps")" Block	
syntax FunPgm::=FunctionDef Stmts
syntax FunPgms::=List{FunPgm, "|"}
syntax Pgm ::= FunPgms Sep MainPgm

syntax Id::="a"   [token]
		   | "b"  [token]
		   | "t"   [token]
		   | "m"  [token]
		   | "n"  [token]
		   | "GCD" [token]
		   | "EUCLID" [token]
		   | "ENQUEUE" [token]
		   | "DEQUEUE" [token]
		   | "TREESEARCH" [token]
		   | "TREEINSERT" [token]
		 //  | "x" [token]
		   | "y" [token]
		  // | "main" [token]
				  
endmodule



module ALG
  imports ALG-SYNTAX
 // imports ALG-CONFIGURATION
   syntax KResult ::= Int | Bool | String

  
  configuration <T color="yellow">
  // thread
 
  <k> $PGM:Pgm</k>
   <fid>.K</fid>
  <tid>.K</tid>
  <env>.Map</env>
  <tenv>.Map </tenv>
<struct> .Map </struct>
//<tree> .List </tree>
	  //functionCall
	  <funs>
	  <fun multiplicity="*">
	  <fun-id> .K</fun-id>
	  <funBody>.Stmts</funBody>
	  <para>.AriExps</para>
	 <returns>.K</returns>
	  </fun>
	  </funs>  
	  //global
	  <stores>.Map</stores>
     //Standard input and output
	   <in color="magenta" stream="stdin"> .List </in>
       <out color="Orchid" stream="stdout"> .List </out> 
		<time>0</time>
              </T>
  

 //tree
 syntax Type::="node""("Id")"
syntax Map::="IniTree""(" Id ")"
			//| "EMPTY"
syntax Int::="<" Id "," Id "," Int "," Id "," Id "," Id ">" //<treeId, parentId, keyValue, leftId, rightId, Id>
			| "<" Id "," Id "," Int "," Int ">" //<treeId, nodeId>
			| "<" Id "," Id "," Id ">"
			| "<" Id "," Id ">"
			| "EMPTY"
			
			
/* syntax Map ::= makeMemberMap(Stmts)    [function]
  rule makeMemberMap(T:Type X:Id VDs:Stmts)
    => X |-> T makeMemberMap(VDs)
  rule makeMemberMap(.Stmts) => .Map*/
			
			
rule IniTree(I:Id)=>root|-><I, NULL, EMPTY, NULL, NULL, root>


/*rule
    <k> struct S:Id { Ss:Stmts }; => .K ...</k>
    <struct>... .Map => S |-> makeMemberMap(Ss) ...</struct>
    [structural]*/
 
 rule <k> X:Id=><X, X> ...</k>
      <tenv>... <X, _:Id, _:Int, _:Int>|->tree ...</tenv>
	  
/*rule <k> X:Id=>-1 ...</k>
      <tenv>... (X|->node) ...</tenv>	
     <struct> ... X|-><_, _, EMPTY, _, _, X> ...</struct>	  
	  //when X1 =/=K X
	  
rule <k> X:Id=><X, X> ...</k>
      <tenv>... (X|->node) ...</tenv>	
     <struct> ... X|-><_, _, N:Int, _, _, X> ...</struct>	
     when N=/=Int EMPTY*/
	 
rule <k> root=><I:Id, I3, N:Int, I1:Id, I2:Id, X>...</k>
	 <tenv> ... <_, X, _:Int, _:Int>|->tree ...</tenv>
	  <struct> ... ((X)|-><I:Id, I3, N:Int, I1:Id, I2:Id, X>) ...</struct>
	when N=/=Int EMPTY	
	
	// <struct> 
rule <k> root=> -1 ...</k>
     <tenv>... <_, X, _:Int, _:Int>|->tree ... </tenv>
	 <struct>... X|-><_, _, EMPTY, _, _, X> ...</struct>
	
	
rule <k>X:Id=<I:Id, I1:Id>=>. ...</k>
     <tenv> ... (I1=>X)|->node ...</tenv>
	 <struct>... (I1=>X)|->_ ... </struct>


	 
rule <k> X:Id=<I:Id, I:Id>=>. ...</k>
     <tenv> ... <(I=>X), _, _:Int, _:Int>|->tree ...</tenv>
	// <struct>... root|-><(I=>X), _, _, _> ... </struct>
	 
rule <k>  tree X:Id=>. ...</k>
 <tenv>... .Map=>(<X, root, 0, 0>|->tree root|->node ) ... </tenv>
 <struct>... .Map=>root|-><X, NULL, EMPTY, NULL, NULL, root> ... </struct>  
 // when T==K tree	
  
 rule <k> node X:Id=>. ...</k>
	  <tenv>...(<I, _, _, _>|->tree) (.Map=>X|->node) ... </tenv>	  
	  <struct>... .Map=>X|-><I, NULL, EMPTY, NULL, NULL, X> ... </struct>  
	  
rule <k> I.root=><I, NULL, N:Int, I1:Id, I2:Id, M:Id> ...</k>
	<tenv> ... <I, M:Id, _, _>|->tree ...</tenv>
	<struct> ... M|-><I, NULL, N:Int, I1:Id, I2:Id, M>  ... </struct>
	
rule <k> X:Id = <I:Id, I3:Id, N:Int, I1:Id, I2:Id, _>=>. ...</k>
	<tenv> ... X|->node ... </tenv>
	<struct> ... X|->(_=><I:Id, I3, N:Int, I1:Id, I2:Id, X>)...</struct>
	//when N=/=Int EMPTY
	
	rule <k> X:Id = <I:Id, I3:Id, N:Int, I1:Id, I2:Id, _>=>. ...</k>
	<tenv> M(.Map=>X|->node) </tenv>
	<struct> ... .Map=>X|-><I:Id, I3, N:Int, I1:Id, I2:Id, X>...</struct>
	when notBool (X in keys(M))
	
rule <k> X:Id=-1=>. ...</k>
	<tenv> ... (.Map=>X|->node) ...</tenv>
	<struct> ... (.Map=>X|-><NULL, NULL, EMPTY, NULL, NULL, X>)...</struct>
	

rule <k> X.p = <I:Id, I3:Id, N:Int, I1:Id, I2:Id, M:Id> =>. ...</k>
     <tenv> ... X:Id|->node ...</tenv>
     <struct> ... X|-><_:Id, _=>M, _:Int, _, _, X> ...</struct>
	
rule <k> X.p = -1 =>. ...</k>
     <tenv> ... X:Id|->node ...</tenv>
     <struct> ... X|-><_:Id, _=>NULL, _:Int, _, _, X> ...</struct>


//bug?	 
rule <k> I.root=<I:Id, I3:Id, N:Int, I1:Id, I2:Id, I4:Id> =>. ...</k>
<tenv> ... (<_,(_=>I4), _, _>|->tree) ...</tenv>
     <struct> ... I4|->(_=><I:Id, I3, N:Int, I1:Id, I2:Id, root>) root|->(_=><I:Id, I3, N:Int, I1:Id, I2:Id, root>) ...</struct>
	
	
rule <k> X:Id=> -1 ...</k>
     <tenv>... X|->node ... </tenv>
	 <struct>... X|-><_, _, EMPTY, _, _, X> ...</struct>
	// when notBool (X in keys(M))
	 
rule NIL=>-1	 

rule <k> X:Id=><I:Id, I3:Id, N:Int, I1:Id, I2:Id, I4:Id> ...</k>
     <tenv>... X|->node ... </tenv>
	 <struct> ... ((X)|-><I:Id, I3, N:Int, I1:Id, I2:Id, I4>) ...</struct>
	when N=/=Int EMPTY
	 
rule <k> X:Id =<I1:Id, left, I:Id> =>. ...</k>
     <struct> ... I|-><I2:Id, I5:Id, N:Int, I3:Id, I4:Id, I6:Id> (X|->(<_, _, _, _, _, I':Id>=><I2:Id, I5, N:Int, I3:Id, I4:Id, I'>)) ...</struct>

	 
	 rule <k> X:Id =<I1:Id, left, I:Id> =>. ...</k>
     <struct> ... X|->(<I2:Id, I3:Id, _, _, _, I'>=><I2, I3, EMPTY, NULL, NULL, I'>) ...</struct>
	 when I==K NULL
	 
rule <k> X:Id =<I1:Id, right, I:Id> =>. ...</k>
     <struct> ... I|-><I2:Id, I5:Id, N:Int, I3:Id, I4:Id, I'> (X|->(<_, _, _, _, _, I1':Id>=><I2:Id, I5, N:Int, I3:Id, I4:Id, I1'>)) ...</struct>
	 
	 rule <k> X:Id =<I1:Id, right, I:Id> =>. ...</k>
     <struct> ... X|->(<I2:Id, I3, _, _, _, I'>=><I2, I3, EMPTY, NULL, NULL, I'>) ...</struct>
	 when I==K NULL	


rule <k> X.key=>N ...</k>
	<tenv>... X:Id|->node ... </tenv>
	 <struct> ... ((X)|-><_, _, N:Int, _, _, X>) ...</struct>
	 
rule <k> X.left=><X, left, I> ...</k>
     <tenv>... X:Id|->node ... </tenv>
	  <struct> ... (X|-><_, _, _, I, _, X>) ...</struct>

	  
	  
rule <k> X.right=><X, right, I> ...</k>
     <tenv>... X:Id|->node ... </tenv>
	  <struct> ... (X|-><_, _, _, _, I, X>) ...</struct>
	 
	  

	  
rule <k> X.left=<I:Id,I1:Id>=>. ...</k>
     <tenv>...(<_, _, N:Int=>N+Int 1, _>|->tree) (X:Id|->node) ... </tenv>
	  <struct> ... (X|-><I, _, _,_=>I1,_, X>) ...</struct>
	 
rule <k> X.right=<I:Id,I1:Id>=>. ...</k>
     <tenv>...(<_, _, _, N:Int=>N+Int 1>|->tree) (X:Id|->node) ... </tenv>
	  <struct> ... (X|-><I, _, _,_,_=>I1, X>) ...</struct>
	  
 rule <k> X.right=<I:Id, I3:Id, N:Int, I1:Id, I2:Id, _> =>. ...</k>
     <tenv>...(<_, _, _, N1:Int=>N1+Int 1>|->tree) ... </tenv>
     <struct> ... (X:Id|-><_, _, _,_,I', X>)(I'|->(_=><I:Id, I3, N:Int, I1:Id, I2:Id, I'>)) ...</struct>
	 when I'=/=K NULL
	  
 rule <k> X.right=<I:Id, I3, N:Int, I1:Id, I2:Id, _> =>. ...</k>
      <tenv>...(<_, _, _, N1:Int=>N1+Int 1>|->tree) ... </tenv>
     <struct> ... (X:Id|-><_, _, _,_,I'=>?I1', X>) (.Map=>(?I1'|-><I:Id, I3, N:Int, I1:Id, I2:Id, ?I1'>)) ...</struct>
	 when I'==K NULL	  
	  
rule <k>(X:Id).key=N:Int=>. ...</k>
	 <tenv>... X:Id|->node ... </tenv>
	  <struct> ... (X|-><_:Id, _, _:Int=>N,_:Id,_:Id, X>) ...</struct>
	  
//AExp

rule <k> int X:Id=>. ...</k>
        <env> Rho => Rho[X <- !N:Int] </env>
       <stores>... .Map => !N |-> 0 ...</stores>

  rule <k>X:Id=>I:Int...</k>
	   <env>...X|->N...</env>
	   <stores>...N|->I...</stores>
  
 
	
 /*  rule <k>X:Id=>?N1:Int...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	   <stores>M:Map=>M[!N<-?N1:Int]</stores>	
	   when notBool (X in keys(Rho))*/
 syntax Int ::= "typemap" "(" Type "," Id ")"	   
 
  rule I1 - I2 => I1 -Int I2
  rule I1 + I2 => I1 +Int I2
  rule I1 mod I2 => I1 %Int I2
  
  //rule <k>&X1=>X1 ...</k>
 

  
 /*    rule <k>  X1= typemap(T, X) =>. ... </k>
  <tenv> ... X|->typemap(T, X)...</tenv>
	 <queueId>X1</queueId>
	 when T==K queue*/
	
	 
  rule <k> X:Id = I:Int => I; ...</k>
       <env>... X |-> N ...</env>
       <stores>... N |-> (_ => I) ...</stores>
         
//rule <k> X:Id=X1:Id=>. ... </k>
	// <stackId>X1=>X</stackId>
	 

	  
/* rule <k>	X:Id = I:Int =>I; ...</k>
	   <env>Rho=>Rho[X<-!N:Int]</env>
	  <stores>M:Map=>M[!N<-I]</stores>
	   when notBool (X in keys(Rho))*/
	   
   rule <k> read() => I ...</k>
     <in> (ListItem(I:Int) => .List) ...</in>  
	 [read]
	 
	//  syntax Printable ::= Int | String
/* currently it is necessary to subsort Printable to AExp,
  but future K should be able to infer that automatically. */
 // syntax AriExp ::= Printable
  //context print(HOLE:AExp, AEs:AExps);
  
  rule <k>error(P:String)=>. ...</k>
		<out>... .List=>ListItem(P) </out> 
		

rule <k> print(P:AriExps)=>. ...</k>
		<out>... .List=>ListItem(P) </out> 
		
  //rule print(.AriExps)=>.  [structural]
  
	   
// BExp
 
  rule I1 != I2 => I1 =/=Int I2
 rule I1 == I2 => I1 ==Int I2
  rule I1 > I2 => I1 >Int I2
  rule I1 < I2 => I1 <Int I2
 rule true or _ => true
 rule false or B:BExp=>B
  rule true and B => B
  rule false and _ => false
  
 //Stmt
 syntax KItem::= Int ";"
 rule  _:Int; => .
 
 // rule <k>if F:FunctionCall S else S1=>if B:BExp S else S1 ...</k>
//  <fun><fun-id>F</fun-id> <returns>B</returns>...</fun>
  rule if true S=>S
  rule if false _=>.Stmts
  rule if true  S else _ => S
  rule if false _ else S => S
  rule if true S elseif B _ else _=>S
  rule if false _ elseif true S else _=>S
  rule if false _ elseif false _ else S=>S
  rule while B S => if B {S while B S} else {.Stmts}  [structural]
   rule <k> {Ss:Stmts} => Ss ...</k>   [structural]
  // Stmts
  rule .Stmts => .                 [structural]
  rule S:Stmt Ss:Stmts => S ~> Ss  [structural]

//functionDefinition  


syntax Stmts ::= mkDecls(AriExps,AriExps)  [function]

  rule mkDecls((X:AriExp, Ps:AriExps), (V:AriExp, Vs:AriExps))
    => X=V~> mkDecls(Ps,Vs) 
	
	//when V=/=K I
	
/*	 rule <k>mkDecls((X:AriExp, Ps:AriExps), (V:AriExp, Vs:AriExps))
    => mkDecls(Ps,Vs) ...</k>
	<stackId>V=>X</stackId>
	//when V==K I*/
	
	
  rule mkDecls(.AriExps,.AriExps) => .Stmts

rule <k>(T:Type F:Id(Ps:AriExps)  Ss:Stmts |F1:MainId(Is:Ids) B:Block=>F1:MainId(Is:Ids) B:Block)</k>
     <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	requires F=/=K main
	
rule <k>(T:Type F:Id(Ps:AriExps) Ss:Stmts | FP:FunPgms |MP:MainPgm=>FP |MP)</k>
     <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	requires F=/=K main	

rule <k> F:MainId(Is:Ids) B:Block=>B ...</k>
     <tid>_=>F</tid>
    requires F==K main
	

rule (.FunPgms | F1:MainId(Is:Ids) B:Block=>F1:MainId(Is:Ids) B:Block)
rule .AriExps=>.
//rule | =>.
	
// Function Call

syntax KItem ::="stores"

	rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	 <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps</para><returns>.K</returns></fun>
	 <env> Env:Map </env>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main

	/*rule <k> stores=>. ...</k>
	     <fid>F</fid>
	    <fun><fun-id>F1</fun-id> <para>(X:Id, Y:Id)</para>...</fun>
		<tenv> ... Y|->node ... </tenv>
		<struct> ... Y|-><I:Id, I3, N:Int, I1:Id, I2:Id, I4> ...</struct>
		<tree> L:List=>L ListItem(<I:Id, I3, N:Int, I1:Id, I2:Id, I4>)  </tree>*/
		
	
	syntax KItem::="tv" "(" Int")" 
	
rule return (F1:Id(Vs:AriExps))=>F1:Id(Vs:AriExps)


rule <k>return (I:Id)~>K =>tv(0)</k>
     <tenv> ... I|->node ...</tenv>
     	 
rule <k>return (I:Id)~>K =>tv(I1) </k>
     <fid>F</fid>
	 <env>...I|->LI...</env>
	 <stores>...LI|->I1:Int ...</stores>
	 
 //rule return (I:Int)=>tv(I)  
	 
rule <k>tv(I:Int)=> .K </k>
     <tid>_=>.K</tid>
	 <fid>_=>.K </fid>
	 <env>M:Map=>.Map</env>
	 <stores>M1:Map=>.Map</stores>
	// <queues>QB:Bag=>.Bag</queues>
	

	
rule FALSE~>.Stmts=>false
rule TRUE=>true

endmodule
