module ALG-SYNTAX

syntax MainId ::= "main"   [token]
syntax Id::= "top"	| "tail" | "head" | "length" | "next" | "key" | "prev" | "NIL" | "left" 
| "right" | "root" |  "p" | "height" | "treeNode" | "tree" | "RED" | "BLACK" | "color"
	syntax ReturnVal::=MyInt | Id | DotId 
 	syntax DotId::=Id"."Id 
			  | Id
			  | Id"."Id"."Id [left]
			  | Id"."Id"."Id"."Id [left]
			   | "&" DotId //[seqstrict(1)]
			   | "*" Id
	syntax Symbol::= FunctionCall
				> MyInt | String | Id |DotId | Int
				
	syntax Value::=Int | "object" "(" Int ")"
	syntax MyInt ::=  "tv" "(" Type "," Value ")"
				//	| "tv" "(" Type ","  "object" "(" Int ")" ")" [smtlib(smt_pointer_object)]
	            | "&" "tv" "(" Type ","  "object" "(" Int ")" ")" 
				
				//| Int
				//[smtlib(smt_pointer_object)]
				// | "object(-1)"  [smtlib(smt_pointer_null)]
	//			  | "<" Map ">"
	
 syntax AExp  ::=   String | "read" "(" ")"  
				 >  AriExp "mod" AriExp              [left, seqstrict]
				 | AriExp "*" AriExp              [left, seqstrict]
				|  AriExp "/" AriExp              [left, seqstrict]
				 >  AriExp "-" AriExp              [left, seqstrict]
				 | AriExp "+" AriExp		[left, seqstrict]
				 
				| AriExp "=" AriExp                [seqstrict(2)]
				| Param "=" AriExp
				
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
				  | "print" "(" AriExps ")" 
				// | BExp  
				//|  Id "(" AriExps")" //[seqstrict(2)]
				| FunctionCall 
				 | Param
				  | "if"  BExp Stmt       [strict(1)]
				 
				  | "if"  BExp Stmt "elseif" BExp Stmt "else" Stmt      [strict(1)]
				 | "if"  BExp Stmt "else" Stmt         [strict(1)]
				
				 | "while" BExp Stmt
				 | "return" "("Id "(" AriExp"," AriExp ")"")"  [seqstrict(2,3)]
				  | "return" "("Id "(" AriExp ")"")"  [seqstrict(2)]
				//| "return" "(" FunctionCall")" // [seqstrict(2)]
				 | "return" "(" ReturnVal ")" [strict]
				 | "return" ";"

				
			 

 syntax Stmts ::= List{Stmt,";"}
  // syntax Ids   ::= List{Id,","} 
syntax AriExp::=AExp | Symbol
syntax AriExps::=List{AriExp, ","} [seqstrict]
syntax FunctionDef::= Type Id "("Params ")" // [seqstrict(3)]
syntax Type::="int" | "void" | "bool" | "struct" Id | "node" | "Troot" |"char"
syntax Param::=Type Id
syntax Params::=List{Param, ","}
syntax VariDecls::=List{Param, ";"}
//syntax FunctionCall::= Id "(" AriExps ")"  //[seqstrict(2)]
//syntax FunctionCall::= Id "(" AriExps")" [seqstrict(2)]	
syntax FunctionCall::= Id "(" AriExp"," AriExp ")" [seqstrict(2,3)]		
					 | Id "(" AriExp ")" [seqstrict(2)]	
                     | Id "(" AriExp"," AriExp "," AriExp ")" [seqstrict(2,3,4)]							 
syntax Ints::=List{MyInt, ","}				 

syntax Sep::= "|"
	syntax MainPgm::=MainId "(" ")" Block	
syntax FunPgm::=FunctionDef Stmts
syntax FunPgms::=List{FunPgm, "|"}

syntax StructDeclaration ::= "struct" Id "{" VariDecls "}" ";"


syntax Pgm ::=FunPgms Sep MainPgm
             | StructDeclaration 
			// | Pgm Pgm
syntax Pgms::=List{Pgm, ""}
syntax File ::= Pgms
syntax Id::="a"   [token]
		   | "b"  [token]
		   | "t"   [token]
		   | "m"  [token]
		   | "n"  [token]
		   | "x"  [token]
		   | "y"  [token]
		   | "z"  [token]
		   | "GCD" [token]
		   | "EUCLID" [token]
		   | "TreeNode" [token]
		   | "TREEINSERT" [token]
		   | "INORDERTREEWALK" [token]
		   | "TREESEARCH" [token]
		   | "TREEDELETE" [token]
		  // | "main" [token]
				  
endmodule



module ALG
  imports ALG-SYNTAX
 // imports ALG-CONFIGURATION
   syntax KResult ::= MyInt | Bool | String

  
  configuration <T color="yellow">
  // thread
 
  <k> $PGM:File:K</k>
  <env>.Map</env>
  <tid>.K</tid>
  <struct> .Map </struct>

	  <fun>.Map</fun>
	
	   <fstack color="blue"> .List </fstack>
	  //global
	  <store>.Map</store>
     <nextLoc>0</nextLoc>
       //Standard input and output
	   <in color="magenta" stream="stdin"> .List </in>
       <out color="Orchid" stream="stdout"> .List </out> 
		<time>0</time>
		 
                </T>
  

  
  rule P:Pgm Ps:Pgms => P ~> Ps   [structural]
  rule .Pgms => .K                   [structural]
  
  syntax KItem::="(" KItem "," Map ")"
				//| "(" Map "," MyInt ")"
				//| "(" Type "," MyInt ")"
			//	| "<" Map ">"
			
 rule RED=>tv(bool, 0)[macro]
 rule BLACK=>tv(bool, 1)[macro]

  rule NIL=>tv(struct treeNode, object(-1))  [macro]
 /* rule <k>  tree X:Id=>. ...</k>
     <env> M1:Map(.Map=>X:Id|->object(N:Int))</env>
     <store> M:Map=>M((object(N)|->(height|->0 root|->object(-1))) object(-1)|-> initializeObject(Members) ) </store>
	  <struct>... S |-> Members:Map ...</struct>
	   <nextLoc>N:Int=>N+Int 1</nextLoc>*/
	   
	   syntax Map ::= initializeObject(Map)    [function]
  rule initializeObject(F:Id |-> T:Type M:Map)
    => F |->tv(T, object(-1)) initializeObject(M)
  rule initializeObject(.Map) => .Map
	   
	   
	   rule <k> struct S:Id I:Id=>.K ...</k>
	   <struct>... S |-> Members:Map ...</struct>
	       <env> M1:Map(.Map=>I:Id|->tv(struct S, object(N:Int)))</env>
		   <store> M2:Map(.Map=>object(N:Int)|-> initializeObject(Members) object(-1)|->initializeObject(Members))</store>
		    <nextLoc>N:Int=>N+Int 1</nextLoc>
			when (notBool object(-1) in keys(M2)) andBool S==K treeNode
			
			 rule <k> struct S:Id I:Id=>.K ...</k>
	   <struct>... S |-> Members:Map ...</struct>
	       <env> M1:Map(.Map=>I:Id|->tv(struct S, object(N:Int)))</env>
		   <store> M2:Map(.Map=>object(N:Int)|-> initializeObject(Members))</store>
		    <nextLoc>N:Int=>N+Int 1</nextLoc>
			when (object(-1) in keys(M2)) orBool S=/=K treeNode
	 
 /* rule <k> node X:Id=>. ...</k>
   <env> M1:Map(.Map=>X:Id|->object(N:Int))</env>
       <store> ... .Map=>object(N)|->(key|->object(-1) left|->object(-1) right|->object(-1)) ...</store>
	    <nextLoc>N:Int=>N+Int 1</nextLoc>*/
	
/*  rule <k> X.root=>I1 ...</k>
       <env> ... X:Id|->object(I:Int) ...</env>
       <store> ...(object(I)|->(height|->0 root|->I1:MyInt)) ...</store>
	   when I1=/=K object(-1)
	   
	   rule  <k> X.root=>object(-1) ...</k>
       <env> ... X:Id|->object(I:Int) ...</env>
       <store> ...(object(I)|->(height|->0 root|->object(-1))) ...</store>*/
	   //when I1=/=K object(-1)
  

  
 /* rule <k> X.key=>I1:MyInt ...</k>
  <env> ... X:Id|->object(I:Int) ...</env>
      <store> ... (object(I)|->(key|->I1 left|->I2:MyInt right|->I3:MyInt ))...</store>*/
	  
rule <k> X.X1:Id=>I3:MyInt ...</k>
        <env> ... X:Id|->tv(T1:Type, object(I:Int)) ...</env>
         <store> ... (object(I)|->(X1|->I3 M:Map))  ...</store>
		
 /*  rule <k> X.right=>object(I3) ...</k>
        <env> ... X:Id|->object(I:Int) ...</env>
         <store> ... (object(I)|->(key|->I1:MyInt left|->I2:MyInt right|->object(I3:Int)))  ...</store>
		 
   rule <k> X.left=>object(I2) ...</k>
        <env> ... X:Id|->object(I:Int) ...</env>
         <store> ... (object(I)|->(key|->I1:MyInt left|->object(I2:Int) right|->I3:MyInt))  ...</store>*/
		 
		 
/*	rule <k> X:Id.right=>object(-1) ...</k>
       
		 
   rule <k> X:Id.left=>object(-1) ...</k>*/
       
  
    
/*	rule <k> X.root=I:MyInt =>. ...</k>
         <env> ... X:Id|->object(I1:Int) ...</env>
          <store> ... (object(I1)|->(height|->0 root|->(_:MyInt=>I))) ...</store>*/


		  
	
		
 /* rule <k> X.right=object(I:Int) =>. ...</k>
	<env> ... X:Id|->object(I1:Int) ...</env>
	<store> ...(object(I1)|->(key|->I3:MyInt left|->I2:MyInt right|->(_=>object(I:Int))))  ...</store>
	
	
	   rule <k> X.left=object(I:Int) =>. ...</k>
	<env> ... X:Id|->object(I1:Int) ...</env>
	<store> ...(object(I1)|->(key|->I3:MyInt left|->(_=>object(I:Int)) right|->I2:MyInt))  ...</store>*/
	
	rule N:Int=>tv(int, N)
		
rule <k> X.X1=I:MyInt =>. ...</k>
     <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	 <store> ... object(I1)|->(X1|->(_=>I) M:Map)...</store>
	
		 
  
  rule <k> (X:Id=tv(T:Type, object(I:Int)))=>. ... </k>
       <env> ... X:Id|->tv(T:Type, object(I1:Int)) ...</env>
      <store> ... (object(I:Int)|->M:Map) (object(I1)|->(M1:Map=>M))...</store>
	  
	/*    rule <k> X:Id=object(I:Int)=>. ... </k>
       <env> ... X:Id|->object(I1:Int) ...</env>
      <store> ... (object(I:Int)
	  |->(height|->0 root|->I2:MyInt)) (object(I1)|->(_=>(height|->0 root|->I2)))...</store>*/
	  
	  
	 // rule <k> 

/* rule 	<k> *X=> &object(I) ... </k>
        <env> ... X:Id|->object(I:Int) ...</env>*/
		
rule <k> &X:Id=>&tv(T1:Type, object(I)) ...</k>
    <env> ... X|->tv(T1:Type, object(I)) ... </env>
		
		
rule <k> &X.X1=>&tv(T:Type, object(I)) ...</k>	
    <env> ... X:Id|->tv(T1:Type, object(I1)) ... </env>
	<store> ... object(I1)|->(X1|->tv(T:Type, object(I)) M:Map) ...</store>
		
		
rule <k> X:Id=&tv(T1:Type, object(I))=>. ... </k>

       <env> ... X:Id|->(_=>tv(T1:Type, object(I))) ...</env>
	//   <store> ... ((object(I1)|->_)=>.Map) (object(I=>I1)|->_) ...</store>
	  
	  
  /*rule <k> X:Id=object(-1)=>. ...</k>
        <env> ... X:Id|->object(I1:Int) ...</env>
       <store> ... object(I1)|->(_=>(key|->object(-1) left|->object(-1) right|->object(-1)))...</store>
	   
	rule <k>X:Id=>object(-1) ...</k>
	<env> ... X:Id|->object(I1:Int) ...</env>
	     <store> ... object(I1)|->(key|->object(-1) left|->object(-1) right|->object(-1)) ...</store>
		// when object(X) in keys(M)*/
		
		rule <k>X:Id=>tv(T1:Type, object(I1)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(key|->tv(T:Type, I2:Int) M:Map) ...</store> 
		// when I2=/=K object(-1)
		 
		 
		 	rule <k>X:Id=>tv(T2:Type, object(-1)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(key|->tv(T2:Type, object(-1)) M:Map) ...</store> 
		 //when I2=/=K object(-1)
		 
		 
		 rule <k>X:Id=>tv(T1:Type, object(I1:Int)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(height|->_ root|->I2:MyInt) ...</store> 
		 
		 
	  rule <k> X.X1.X2=>tv(T3:Type, object(I))...</k>
	  <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... (object(I1)|->((X1:Id|->tv(T:Type, object(I2))) M:Map)) 
		 (object(I2:Int)|->((X2:Id|->tv(T3:Type, object(I:Int))) _))...</store> 
	  when I2=/=Int -1
	  
	  
	 rule <k> X.X1.X2=>tv(T2:Type, object(-1))...</k>
	  <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... (object(I1)|->(X1:Id|->tv(T2:Type, object(-1)) M:Map))  ...</store> 
		 
		 
    rule <k> X.X1.X2=I:MyInt=>. ...</k>
	  <env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... (object(I1)|->(X1:Id|->tv(T2:Type,object(I2)) M:Map)) (object(I2)|->(X2:Id|->(_=>I) M1:Map))  ...</store> 

	
//	rule X:Id.p=I:MyInt=>.	
		 
		 
/*	rule <k> X.key=I:MyInt=>. ...</k>
	<env> ... X:Id|->object(I1:Int) ...</env>
	    <store> ... object(I1)|->(key|->(_=>I) M:Map) ...</store>*/
		 
	//rule <k> 
  
syntax KItem ::= mkDecls(Params,AriExps)  [function]

  rule mkDecls((T:Type X:Id, Ps:Params), (V:AriExp, Vs:AriExps))
    => T X~>X=V~> mkDecls(Ps,Vs)
	
  rule mkDecls(.Params,.AriExps) => .K

  rule <k>X:Id=>tv(T, I)...</k>
	   <env>...X|->tv(T:Type, N:Int)...</env>
	   <store>...N|->tv(T, I)...</store>
  
 rule <k> int X:Id=>. ...</k>
        <env> Rho => Rho[X <- tv(int, N:Int)] </env>
       <store>... .Map =>N |-> tv(int, 0) ...</store>
	    <nextLoc>N:Int=>N+Int 1</nextLoc>
	
	rule <k> X:Id=tv(T, I)=>. ...</k>
	     <env>... X|->tv(bool, N:Int) ...</env>
		 <store>... N|->(_=>tv(T, I))...</store>
		 
	rule <k> bool X:Id=>. ...</k>
        <env> Rho => Rho[X <- tv(bool, N:Int)] </env>
       <store>... .Map =>N |-> tv(bool, 0) ...</store>
	    <nextLoc>N:Int=>N+Int 1</nextLoc>
	
	
  /* rule <k>X:Id=>?N1:MyInt...</k>
	   <env>Rho=>Rho[X<-!N:MyInt]</env>
	   <store>M:Map=>M[!N<-?N1:MyInt]</store>	
	   when notBool (X in keys(Rho))*/
	   
 
  rule tv(int, I1) - tv(int, I2) => I1 -Int I2
  rule tv(int, I1) mod tv(int, I2) => I1 %Int I2
  
 rule <k> X:Id = tv(int, I) => .K ...</k>
       <env>... X |-> tv(int, N:Int) ...</env>
       <store>... N |-> tv(int, (_ => I)) ...</store>
         
	  
 /*rule <k>	X:Id = I:MyInt =>I; ...</k>
	   <env>Rho=>Rho[X<-!N:MyInt]</env>
	  <store>M:Map=>M[!N<-I]</store>
	   when notBool (X in keys(Rho))*/
	   
   rule <k> read() => tv(int, I) ...</k>
     <in> (ListItem(I:Int) => .List) ...</in>  
	 [read]
	 
	   syntax Printable ::= Int | String
/* currently it is necessary to subsort Printable to AExp,
  but future K should be able to infer that automatically. */
  syntax AExp ::= Printable
  context print(HOLE:AriExp, AEs:AriExps)
  
  rule <k> print(P:Printable,AEs => AEs) ...</k>
       <out>... .List => ListItem(P) </out>  [print]
  rule print(.AriExps) => .  [structural]
	   
// BExp
 
  rule tv(T1:Type, I1:Value) != tv(T2:Type, I2:Value) => I1 =/=K I2
 rule tv(T1:Type, I1) == tv(T2:Type, I2) => I1 ==K I2
  rule tv(int, I1) > tv(int, I2) => I1 >Int I2
  rule tv(int, I1) < tv(int, I2) => I1 <Int I2
  rule true or _ => true
 rule false or B:BExp=>B
  rule true and B => B
  rule false and _ => false
 //rule I1:MyInt !=I2:MyInt=> I1 =/=K I2 
 // rule I1:MyInt == I2:MyInt => I1 ==K I2 
 /* rule object(-1) != object(-1) => false
  rule object(-1) != object(-1) =>false
  rule object(-1) == object(-1) =>true
  rule object(-1) == object(-1) =>true*/

  
  
 //Stmt
 syntax KItem::= Int ";"
 rule  _:Int; => .
 //rule ;=>.
 
  rule if true  S else _ => S
  rule if false _ else S => S
  rule if true S=>S
  rule if false _=>.Stmts
   rule if true S elseif B _ else _=>S
  rule if false _ elseif true S else _=>S
  rule if false _ elseif false _ else S=>S
  rule <k>while B S => if B {S; while B S} else {.Stmts} ...</k> <time>T:Int=>T+Int 1</time>  [structural]
 
   rule <k> {Ss:Stmts} => Ss ...</k>   [structural]
  // Stmts
  rule .Stmts => .                 [structural]
  rule S:Stmt; Ss:Stmts => S ~> Ss  [structural]

  syntax Map ::= "makeMemberMap""("VariDecls")"    [function]
  rule makeMemberMap(T:Type X:Id; VDs:VariDecls)
    => X |-> T makeMemberMap(VDs)
  rule makeMemberMap(.VariDecls) => .Map

  rule
    <k> struct S:Id { VDs:VariDecls }; => .K ...</k>
    <struct>... .Map => S |-> makeMemberMap(VDs) ...</struct>
  //  [structural]

  
  
  
//functionDefinition  
syntax KItem ::= "functionBody""(" Param"," Param"," Type"," Stmts")"
			   | "functionBody""(" Param"," Type"," Stmts")"
			   | "functionBody""(" Param"," Param"," Param"," Type"," Stmts")"


			   
rule <k>(T:Type F:Id(P1:Param) Ss:Stmts| FP:FunPgms  |MP:MainPgm)=>(FP |MP)...</k>
   //  <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para></fun>)</funs>
	 <fun> ... .Map=>F|->functionBody(P1, T, Ss) ...</fun>
	requires F=/=K main


/*rule <k>(T:Type F:Id(P1:Param, P2:Param) Ss:Stmts |F1:MainId() B:Block=>F1:MainId() B:Block)</k>
   //  <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para></fun>)</funs>
	 <fun> ... .Map=>F|->functionBody(P1, P2, T, Ss) ...</fun>
	requires F=/=K main*/
	
	
rule <k>(T:Type F:Id(P1:Param, P2:Param, P3:Param) Ss:Stmts | FP:FunPgms |MP:MainPgm)=>(FP |MP)...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, P3, T, Ss) ...</fun> 
	requires F=/=K main	

rule <k>(T:Type F:Id(P1:Param, P2:Param) Ss:Stmts | FP:FunPgms |MP:MainPgm)=>(FP |MP)...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, T, Ss) ...</fun> 
	requires F=/=K main	
	
	rule .FunPgms | F1:MainId() B:Block =>F1:MainId() B:Block
rule <k> F:MainId() B:Block=>B ...</k>
     <tid>_=>F</tid>
    requires F==K main
	

rule .FunPgms=>.
rule .AriExps=>.

	
// Function Call

syntax KItem::="(" Map "," Map "," K ")"
			  | "clearEnv"
syntax Map::= "delete" "("Map "," Map ")" [function]
			  
rule delete((I1|->I2) M1:Map, I1|->I2 M:Map)=>delete(M1, M)
rule delete(M:Map, .Map)=>M


rule T:Type A1:Id=A2:AriExp =>T A1~>A1=A2


rule <k>(F1:Id(A1:MyInt, A2:MyInt)~>K) =>(P1:Param=A1~>P2:Param=A2~>Ss)</k>
<fstack> .List => ListItem((Env, .Map, K)) ...</fstack>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun> ...F1|->functionBody(P1, P2, _:Type, Ss:Stmts)
    ...</fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map</store>
	// <gstore>_=>STORE:Map </gstore>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main
	
	
	rule <k>(F1:Id(A1:MyInt, A2:MyInt, A3:MyInt)~>K) =>(P1:Param=A1~>P2:Param=A2~>P3:Param=A3~>Ss)</k>
<fstack> .List => ListItem((Env, .Map, K)) ...</fstack>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun> ...F1|->functionBody(P1, P2, P3, _:Type, Ss:Stmts)
    ...</fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map</store>
	// <gstore>_=>STORE:Map </gstore>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main
	
	rule <k>(F1:Id(A1:MyInt)~>K) =>(P1:Param=A1~>Ss)</k>
<fstack> .List => ListItem((Env, .Map, K)) ...</fstack>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun> ...F1|->functionBody(P1, _:Type, Ss:Stmts)
    ...</fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map</store>
	// <gstore>_=>STORE:Map </gstore>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main


/*rule <k>clearEnv=>.K ...</k>
     <fstack>ListItem((Env, STORE, K))</fstack>
     <env>M:Map=>delete(M, Env:Map)</env>
	 <store>M1:Map=>delete(M1, STORE:Map)</store>*/

/*	rule <k>((F1:Id(Is:AriExps)~>K) =>mkDecls(Ps, Is)~>Ss)</k>
	//rule <k>(F1:Id(Is:MyInt) =>mkDecls(Ps, Vs)~>B)... </k>
      <fstack> .List => ListItem((Env, STORE, K)) ...</fstack>
	 <tid>F</tid>
	 <fid>_=>F1</fid>
	// <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps:Params</para></fun>
	 <fun> ...F1|->functionBody(Ps:Params, _:Type, Ss:Stmts)
    ...</fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map=>.Map</store>
	 <time>T:MyInt=>T+MyInt 1</time>
	requires F==K main*/
	
/*	rule <k>(return (F1:Id(Vs:AriExps))=>mkDecls(Ps, Vs)~>B)...</k>
		 <tid>F</tid>
	 <fid>_=>F1</fid>
	 <fun><fun-id>F1</fun-id> <funBody> B</funBody><para>Ps</para></fun>
	 <env> Env:Map </env>
	 <time>T:MyInt=>T+MyInt 1</time>
	requires F==K main*/

rule <k>(return (F1:Id(A1:MyInt, A2:MyInt)))~>_=>F1:Id(A1:MyInt, A2:MyInt)~>K</k>
<env>_=>Env</env>
//<store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	 
	 rule <k>(return (F1:Id(A1:MyInt)))~>_=>F1:Id(A1:MyInt)~>K</k>
<env>_=>Env</env>
//<store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	

/*	syntax KItem::="tv" "(" MyInt")" 
				  | "tv" "(" Id ")"*/
	
rule <k>(return (I:MyInt))~>_ =>I~>K</k>
  //   <fid>F</fid>
	 <env>_=>Env</env>
	// <store> _=>STORE </store>
	// <gstore> _=>STORE:Map </gstore>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
    
rule <k>(return; )~>_ =>K</k>
  //   <fid>F</fid>
	 <env>_=>Env</env>
	// <store> _=>STORE </store>
	// <gstore> _=>STORE:Map </gstore>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	 
/*rule <k>tv(I:Id)=> .K ... </k>
     <tid>_=>.K</tid>
	// <fid>_=>.K </fid>
	 <env>M:Map=>.Map</env>
	 <store>M1:Map=>.Map</store>
	//  <fstack> _:List => .List</fstack>*/

endmodule
