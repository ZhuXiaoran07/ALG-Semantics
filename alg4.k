

module ALG4-SYNTAX
imports SET
imports INT
imports FLOAT


syntax MainId ::= "main"   [token]
syntax Id::= "top"	[token]| "tail" [token]| "head" [token]| "length" [token]| "next" [token]| "key" [token]
| "prev" [token]|"left" [token] | "nil" [token] |"freq" [token] | "min" [token] |"graph" [token] |"vertex" [token]
| "right" [token] | "List" [token] | "ListNode" [token] | "FibHeap" [token] | "FibHeapNode" [token]
| "root" [token]|  "p" [token]| "height" [token]| "treeNode" [token]| "tree" [token] | "graph" [token] | "vertex" [token]
| "RED" | "BLACK" | "color"  |"rows" [token] | "columns" [token] | "QUEUE" [token]
| "WHITE" | "GRAY" | "PI"//[token] | 

syntax Id::="NIL" | "EMPTY" | "TRUE" | "FALSE"

	syntax ReturnVal::=MyInt | DotId | Int | AExp | Array | ObjValue
 	syntax DotId::=  Id
			  | Id"."Id"."Id [left]
			  | Id"."Id 
			  | Id"."Id"."Id"."Id [left]
			   | "&" DotId 
			   | "*" Id
			  | "object""(" Int")" "." Id /
			  
	syntax Symbol::= FunctionCall
				> MyInt | String |DotId | Int | Array
				 
	
	
	syntax Value::=Int | ObjValue
	syntax ObjValue::="object" "(" Int ")" 
	syntax MyInt ::=  "tv" "(" Type "," Value ")"
	            | "&" "tv" "(" Type ","  "object" "(" Int ")" ")" 
				| Set
				 
				
	syntax Set::="{" Symbol"}" [seqstrict(1)]
				//| Id
				| "|" Id "INTERSECT" Id "|"
			
	syntax Array::=  Id "[" AriExp "]"     [seqstrict(2)]
				| "&" Id "[" AriExp "]"  [seqstrict(2)]
	             | Id"."Id "[" AriExp "]"     [seqstrict(3)]
				 | Id"."Id "[" AriExp "]""["AriExp"]"    [seqstrict(3,4)]
				 | Id "[" AriExp "]" "["AriExp"]"           [seqstrict(2,3)]
				 | Id "[" AriExp "]" "[" AriExp "]" "[" AriExp "]" [seqstrict(2,3,4)]
				| Id"."Id "[" AriExp "]""."Id     [seqstrict(3)]
				 | "&"Id"."Id "[" AriExp "]"     [seqstrict(3)]
	
 syntax AExp  ::=    "read" "(" ")" | "score" "(" Id ")"
				 >  AriExp "mod" AriExp              [left, seqstrict]
				 | AriExp "*" AriExp              [left, seqstrict]
				|  AriExp "/" AriExp              [left, seqstrict]
				 | AriExp "^" AriExp              [left, seqstrict]
				 | "lg" AriExp                    [strict(1)]
				 >  AriExp "-" AriExp              [left, seqstrict]
				 | AriExp "+" AriExp		[left, seqstrict]
				 
				| DotId "="AriExp                [strict(2)]
				| Param "=" AriExp 
				| Id "[" AriExp "]" "=" AriExp      [seqstrict(3, 2)]
				| Id"."Id"["AriExp"]" "=" AriExp      [seqstrict(4, 3)]
				| Id"."Id"["AriExp"]""."Id "=" AriExp      [seqstrict(5, 3)]
				| Id"."Id"["AriExp"]""["AriExp"]" "=" AriExp      [seqstrict(5,4, 3)]
				| Id "[" AriExp "]""[" AriExp "]" "=" AriExp      [seqstrict(4,3, 2)]
				| Id "[" AriExp "]""[" AriExp "]""[" AriExp"]" "=" AriExp      [seqstrict(5,4,3, 2)]
				 | Symbol "=" "<" Symbol ">"
			
				 | "("Symbols ")""=" AriExps        [seqstrict(2)]
				 | Symbol "=" "(" Ids ")"  [strict(2)]
				 | "1" ".." AExp
				 | AriExp "||" AriExp
				 | AriExp "&&" AriExp
                 | "(" AExp ")"               [bracket] 
				 | "RANDOM" "(" AriExp"," AriExp ")" [seqstrict(1, 2)]
				 | 	"SIGMA" "(" AriExp ")" "(" AExp ")" "(" AExp ")"
				 | Symbol "=" BExp 				[left, strict(2)]
				 | Set "SUNION" Set
				| Id "SUNION" Set [seqstrict(1, 2)]
				| Set "SUNION" FunctionCall  [seqstrict(2)]
				| "spawn" Stmt
				 
				 
				 
syntax BExp  ::= Bool 
				// | Symbol "<" Symbol
				 | AriExp "!=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				  | AriExp "==" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp ">" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "<" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "<=" AriExp "<=" AriExp
				 | AriExp ">=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "<=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "|" AriExp        	   [seqstrict, latex({#1}\leq{#2})]
				  | "!" BExp           [strict]
				 | "not" BExp
				  > BExp "and" BExp      [left, strict(1)]
				 | BExp "or" BExp       [left, strict(1)]
				  | "(" BExp ")"               [bracket]
			  // | AriExp "|" AriExp
			   | FunctionCall

  syntax Block ::="{" Stmts "}"
  
 syntax IfStmt::= "if"  BExp Stmt "else" Stmt         [seqstrict(1)]
				 |  "if"  FunctionCall 
                   Stmt "else" Stmt         [seqstrict(1)]
				 | "if" BExp  Stmt           [seqstrict(1)]
			     |  "if"  BExp 
                   Stmt "elseif" BExp Stmt
				    "else" Stmt[strict(1)]
				| "if" BExp Stmt "elseif" BExp Stmt "elseif" BExp Stmt

				 
  syntax Stmt  ::= Block 
				  | AExp
				  | "print" "(" AriExps ")" 
				// | BExp  
				//|  Id "(" AriExps")" //[seqstrict(2)]
				| FunctionCall 
				 | Param
				 | IfStmt
				 | "spawn" Stmt
				 | "GetValue" "<" ReturnVal ">" [seqstrict(1)]
				| "sync"
				 | "parallel" Stmt
				 | "while" BExp Stmt
				 | "return" "("Id "(" AriExp"," AriExp ")"")"  [seqstrict(2,3)]
				  | "return" "("Id "(" AriExp ")"")"  [seqstrict(2)]
				  | "return" "("Id "(" AriExp","  AriExp"," AriExp ")"")"  [seqstrict(2,3,4)]
				   | "return" "("Id "(" AriExp","  AriExp"," AriExp "," AriExp ")"")"  [seqstrict(2,3,4,5)]
				//| "return" "(" FunctionCall")" // [seqstrict(2)]
				 | "return" "(" ReturnVal","ReturnVal","ReturnVal ")" [seqstrict(1,2,3)]
				 | "return" "(" ReturnVal","ReturnVal ")" [seqstrict(1,2)]
				  | "return" "(" ReturnVal","ReturnVal","ReturnVal"," ReturnVal ")" [seqstrict(1,2,3)]
				  | "return" "(" ReturnVal ")" [strict(1)]
				 | "return" ";"
			//	 | "return" "(" BExp ")" [strict(1)]
				 | "repeat" Stmt "until" BExp
				 
				| "move" Id "to the front of list" Id
				| "error" "("String ")"
				// | "exchange" AriExp "with" AriExp

				
			 

 syntax Stmts ::= List{Stmt,";"}
  syntax Ids   ::= List{Id,","} 
   syntax AExps ::= List{AExp,","}
 //  syntax ReturnVals ::=List{ReturnVal, ","}
syntax AriExp::=AExp | Symbol
syntax AriExps::=List{AriExp, ","} [seqstrict]
syntax FunctionDef::= Type Id "("Params ")" // [seqstrict(3)]
syntax Type::="int" | "void" | "bool" | "struct" Id | "node"
             | "Troot" | "ArrType" | "SET" | "char" | Type "*"
syntax Param::=Type Id | Type Id "[" AriExp "]" [seqstrict(3)] 
			| Type Id "[" AriExp "]""["AriExp"]" [seqstrict(3,4)]
			| Type Id "[" AriExp "]""["AriExp"]" "[" AriExp "]" [seqstrict(3,4,5)]
syntax Params::=List{Param, ","}
syntax VariDecls::=List{Param, ";"}
syntax Symbols::=List{Symbol, ","}

syntax FunctionCall::= Id "(" AriExp"," AriExp ")" [seqstrict(2,3)]		
					 | Id "(" AriExp ")" [seqstrict(2)]	
                     | Id "(" AriExp"," AriExp "," AriExp ")" [seqstrict(2,3,4)]
					| Id "(" AriExp"," AriExp "," AriExp "," AriExp ")" [seqstrict(2,3,4,5)]
					| Id "(" AriExp"," AriExp "," AriExp "," AriExp "," AriExp ")" [seqstrict(2,3,4,5,6)]
					| Id "(" AriExp"," AriExp "," AriExp "," AriExp "," AriExp "," AriExp ")" [seqstrict(2,3,4,5,6,7)]
					| Id "(" AriExp"," AriExp "," AriExp "," AriExp "," AriExp "," AriExp "," AriExp ")" [seqstrict(2,3,4,5,6,7,8)]
syntax Ints::=List{MyInt, ","}				 

syntax Sep::= "|"
	syntax MainPgm::=MainId "(" ")" Block	
syntax FunPgm::=FunctionDef Stmts
syntax FunPgms::=List{FunPgm, "|"}

syntax StructDeclaration ::= "struct" Id "{" VariDecls "}" ";"


syntax Pgm ::=FunPgm 
			 | MainPgm
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
		   | "INSERTIONSORT" [token]
		   | "RANDOMIZEDPARTITION" [token]
		   | "RANDOMIZEDQUICKSORT" [token]
		   | "PARTITION" [token]
		   | "FINDMAXIMUMSUBARRAY" [token]
		   | "FINDMAXCROSSINGSUBARRAY" [token]
		   | "RANDOMIZEDSELECT" [token]
		  // | "main" [token]
				  
endmodule



module ALG4
  imports ALG4-SYNTAX
   syntax KResult ::= MyInt | Bool | String

  
  configuration <T color="yellow">
  // thread
  <threads color="orange">
   <thread multiplicity="*" color="blue">
  <k> $PGM:File:K</k>
  <env>.Map</env>
   <id color="black"> 0 </id>
   </thread>
    </threads>
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
				
  /*
   * Macros
   */				
 rule RED=>tv(bool, 0)[macro]
 rule WHITE=>tv(char, 2) [macro]
 rule BLACK=>tv(char, 1) [macro]
 rule GRAY=>tv(char, 0) [macro]

rule PI=> 3.14

rule EMPTY=>.Set 
rule score(I:Id)=>1
rule score(I:Id)=>2
rule score(I:Id)=>3
rule score(I:Id)=>4
rule score(I:Id)=>5
rule score(I:Id)=>6
rule score(I:Id)=>7
rule score(I:Id)=>8
rule score(I:Id)=>9
rule score(I:Id)=>10
  rule RANDOM(tv(int,I1:Int), tv(int,I2:Int))=>tv(int,(I1+Int I2)/Int 2:Int) 

// SET 
rule {S1:Symbol} SUNION S2:Set=>SetItem(S1) S2 requires notBool (S1 in S2)
rule S1:Set SUNION {S2:Symbol}=>S1 SetItem(S2) requires notBool (S2 in S1)
rule {S1:Symbol} SUNION S2:Set=>S2 requires (S1 in S2)
rule S1:Set SUNION {S2:Symbol}=>S1 requires (S2 in S1)
rule {S1:Symbol} SUNION S2:Set=>SetItem(S1) SetItem(S2) requires S1=/=K S2

 
  rule <k> SET I:Id=>.K ...</k>
       <env> ... .Map=>I|->tv(SET, N) ...</env>
	   <store> ... .Map=>(N|-> .Set)...</store>
	    <nextLoc>N:Int=>N+Int 1</nextLoc>
		
		rule <k>I:Id=> S:Set ...</k>
		     <env> ... I|->tv(SET, N:Int) ...</env>
			 <store> ... N|->S ...</store>
			
	rule <k> I=S:Set=>.K ...</k>
	 <env> ... I:Id|->tv(SET, N:Int) ...</env>
			 <store> ... N|->(_=>S) ...</store>
	   
//Array  
 syntax KItem ::="["Id "," Int "]"
//syntax KItem ::= "value-array" "("  Int  ")"

syntax KItem::=  "update" "(" Id "," Int "," Int ")"
			   | lambda(Type, Params, Stmts)
syntax Map::=	"array-map" "(" Type "," Int ")"  [function]
			| "dimeArray-map" "(" Type "," Int"," Int ")"  [function]
			| "dimeArray-Ini" "("Type ","Int "," Int ")"   [function]

syntax Int::="tree_height" "(" DotId ")" [function]


			
  rule P:Pgm Ps:Pgms => P ~> Ps   [structural]
  rule .Pgms => .K                   [structural]
  
 


rule <k>ArrType I:Id=>.K ... </k>
     <env> ... .Map=>I|->tv(ArrType, object(N)) ... </env>
      <nextLoc>N:Int=>N+Int 1</nextLoc>


rule array-map(T:Type, I:Int)=> I-Int 1|->tv(T, 0) array-map(T:Type, I-Int 1) requires I>Int 0 

	
rule dimeArray-map(T:Type, I1, I2)=>dimeArray-Ini(T, I1-Int 1, I2-Int 1) dimeArray-map(T:Type, I1-Int 1, I2)
     requires I1>=Int 0 andBool I2>=Int 0
 rule dimeArray-Ini(T, I1, I2)=>(I1, I2)|->tv(T, 0) dimeArray-Ini(T, I1, I2-Int 1)
     requires I2>=Int 0 andBool I1>=Int 0
rule dimeArray-Ini(T, I1, -1)=>.Map
rule dimeArray-Ini(T, -1, I2)=>.Map
rule dimeArray-map(T, -1, I)=>.Map
						




rule array-map(I, 0)=>.Map
rule <k>int X:Id[tv(T:Type, I1)][tv(T:Type, I2)]=>.K ...</k>
     <env>.Map=>X|->tv(ArrType, object(N)) ... </env>
	 <store>... .Map=>object(N)|->(rows|->tv(int, I1) columns|->tv(int, I2) dimeArray-map(int, I1, I2))...</store>
	 <nextLoc>N:Int=>N+Int 1</nextLoc>
	 
rule <k> int X:Id[tv(T:Type, I1)][tv(T:Type, I2)][tv(T:Type, I3)]=>.K ...</k>
     <env> ... .Map=>X[I1]|->tv(ArrType, object(N)) ... </env>
	 <store>... .Map=>object(N)|->(rows|->tv(int, I2) columns|->tv(int, I3) dimeArray-map(int, I2, I3))...</store>
	 <nextLoc>N:Int=>N+Int 1</nextLoc>

 rule <k> int X:Id[tv(T:Type, I)]=>.K ...</k>
      <env> ... .Map=>X|->tv(ArrType, object(N)) ... </env>
	  <store> ... .Map=>object(N)|->(length|->tv(int, I) array-map(int, I)) ...</store>
	   <nextLoc>N:Int=>N+Int 1</nextLoc>
	   
	   

	
//declarartion of array 	
rule <k> struct S:Id* I:Id[tv(T:Type, I1)] =>.K ...</k>
     <struct>... S |-> Members:Map ...</struct>
	    <env> M1:Map(.Map=>I:Id|->tv(struct S, object(N:Int)))</env>
		 <store> M2:Map(.Map=>object(N:Int)|-> initializeArrayObject(I1, Members) object(-1)|->initializeObject(Members))</store>
		    <nextLoc>N:Int=>N+Int 1</nextLoc>
			when (notBool object(-1) in keys(M2)) 
			andBool (S==K treeNode orBool S==K ListNode orBool S==K FibHeapNode orBool S==K vertex)

rule <k>X:Id[tv(T:Type, I)]=tv(T:Type, I1)=>.K ... </k>
     <env> ... X|->tv(ArrType, object(N)) ... </env>
     <store> ... object(N)|->(I|->(_=>tv(T:Type, I1)) M:Map) ... </store>
	 


rule <k>X:Id[tv(T:Type, I1)][tv(T:Type, I2)]=tv(T:Type, I3)=>.K ... </k>
     <env> ... X|->tv(ArrType, object(N)) ... </env>
     <store> ... object(N)|->((I1, I2)|->(_=>tv(T:Type, I3)) M:Map) ... </store>

	 
	 rule <k>X:Id[tv(T:Type, I1)][tv(T:Type, I2)][tv(T:Type, I4)]=tv(T:Type, I3)=>.K ... </k>
     <env> ... X[I1]|->tv(ArrType, object(N)) ... </env>
     <store> ... object(N)|->((I2, I4)|->(_=>tv(T:Type, I3)) M:Map) ... </store>
	 
	 
	  rule <k>X:Id[tv(T:Type, I1)][tv(T:Type, I2)][tv(T:Type, I4)]=>tv(T:Type, I3) ... </k>
     <env> ... X[I1]|->tv(ArrType, object(N)) ... </env>
     <store> ... object(N)|->((I2, I4)|->tv(T:Type, I3) M:Map) ... </store>
	 
rule <k>X:Id[I]=tv(T:Type, I1)=>.K ... </k>
     <env> ... X|->tv(ArrType, object(N)) ... </env>
     <store> ... object(N)|->(I|->(_=>tv(T:Type, I1)) M:Map) ... </store>

rule <k> X:Id[tv(_:Type, I)]=&tv(T:Type, object(N))=>. ...</k>
    <env> ...X[I]|->(_=>tv(T:Type, object(N)))...</env>

rule <k> &X:Id[tv(_:Type, I)]=>&tv(T:Type, object(N)) ...</k>
     <env> ... X[I]|->tv(T:Type, object(N))...</env>

//rule X:Id[I]=>I
rule <k> (X:Id[tv(T:Type, I)]=>tv(T1:Type, I1))...</k>
     <env> ... X|->tv(ArrType, object(N)) ... </env>
	 <store> ... object(N)|->(I|-> tv(T1:Type, I1) M:Map) ... </store>
	 
rule <k> (X:Id[tv(T:Type, I1)][tv(T:Type, I2)]=>tv(T1:Type, I3))...</k>
     <env> ... X|->tv(ArrType, object(N)) ... </env>
	 <store> ... object(N)|->((I1, I2)|-> tv(T1:Type, I3) M:Map) ... </store>
	 
	 
rule <k>(X:Id[tv(T:Type, I1)][tv(T:Type, I2)]=>tv(T:Type, object(-1)))...</k>
     <env> ... X|->tv(ArrType, object(N)) ... </env>
	 <store> ... object(N)|->( M:Map) ... </store>
	 when notBool ((I1, I2) in keys(M))
	 
rule <k> (X:Id[I]=>tv(T:Type, I1))...</k>
     <env> ... X|->tv(ArrType, object(N)) ... </env>
	 <store> ... object(N)|->(I|-> tv(T:Type, I1) M:Map) ... </store>
  
  
  
 //struct 
  syntax KItem::="(" KItem "," Map ")"
				//| "(" Map "," MyInt ")"
				//| "(" Type "," MyInt ")"
			//	| "<" Map ">"

  rule NIL=>tv(struct treeNode, object(-1))  [macro]
  // rule NIL=>tv(struct ListNode, object(-1))  [macro]
  // rule NIL=>0  [macro]
rule N:Int=>tv(int, N)  //[macro]
	   
	   syntax Map ::= initializeObject(Map)    [function]
					| "initializeArrayObject" "(" Int "," Map ")" [function]
  rule initializeObject(F:Id |-> T:Type M:Map)
    => F |->tv(T, object(-1)) initializeObject(M)
	when T=/=K int andBool T=/=K bool
	
rule initializeObject(F:Id |-> T:Type M:Map)
    => F |->tv(T, 0) initializeObject(M)
	when T==K int orBool T==K bool	
  rule initializeObject(.Map) => .Map
  
  rule initializeArrayObject(I, M:Map)=>I-Int 1|->(key|->tv(int, 0) initializeObject(M)) initializeArrayObject(I-Int 1, M)
  requires I>Int 0
  rule initializeArrayObject(0,M)=>.Map
  

  
  

  
 
	   
	   rule <k> struct S:Id* I:Id=>.K ...</k>
	   <struct>... S |-> Members:Map ...</struct>
	       <env> M1:Map(.Map=>I:Id|->tv(struct S, object(N:Int)))</env>
		   <store> M2:Map(.Map=>object(N:Int)|-> initializeObject(Members) object(-1)|->initializeObject(Members))</store>
		    <nextLoc>N:Int=>N+Int 1</nextLoc>
			when (notBool object(-1) in keys(M2)) 
			andBool (S==K treeNode orBool S==K ListNode orBool S==K FibHeapNode orBool S==K vertex)
			
			 rule <k> struct S:Id* I:Id=>.K ...</k>
	   <struct>... S |-> Members:Map ...</struct>
	       <env> M1:Map(.Map=>I:Id|->tv(struct S, object(N:Int)))</env>
		   <store> M2:Map(.Map=>object(N:Int)|-> initializeObject(Members))</store>
		    <nextLoc>N:Int=>N+Int 1</nextLoc>
			when (object(-1) in keys(M2)) orBool S=/=K treeNode
//rules about dotId	 

rule <k> X.X1:Id=>I3:MyInt ...</k>
        <env> ... X:Id|->tv(T1:Type, object(I:Int)) ...</env>
         <store> ... (object(I)|->(X1|->I3 M:Map))  ...</store>

rule <k> X.X1[tv(_,N:Int)]=>I3:MyInt ...</k>
        <env> ... X:Id|->tv(T1:Type, object(I:Int)) ...</env>
         <store> ... (object(I)|->(X1|->tv(T2:Type, object(I1:Int)) M:Map))
     		  object(I1)|->(N|->I3:MyInt M1:Map) ...</store>
			requires T1=/=K struct graph 
			
rule <k> X.X1[tv(_,N:Int)]=I3:MyInt=>. ...</k>

        <env> ... X:Id|->tv(T1:Type, object(I:Int)) ...</env>
         <store> ... (object(I)|->(X1|->tv(T2:Type, object(I1:Int)) M:Map))
     		  object(I1)|->(N|->(_=>I3:MyInt)  M1:Map) ...</store>	
requires T1=/=K struct graph 			  

		 
rule <k> X.X1[tv(_,N:Int)]=>I3:MyInt ...</k>
        <env> ... X:Id|->tv(T1:Type, object(I:Int)) ...</env>
         <store> ... (object(I)|->(X1|->tv(T2:Type, object(I1:Int)) M:Map))
     		  object(I1)|->(N|->(key|->I3:MyInt M2:Map) M1:Map) ...</store>
			  
rule <k> X.X1[tv(_,N:Int)]=I3:MyInt=>. ...</k>
        <env> ... X:Id|->tv(T1:Type, object(I:Int)) ...</env>
         <store> ... (object(I)|->(X1|->tv(T2:Type, object(I1:Int)) M:Map))
     		  object(I1)|->(N|->(key|->(_=>I3:MyInt) M2:Map) M1:Map) ...</store>			  
			  

			  rule <k> X.X1[tv(_,N:Int)].X2=>I3:MyInt ...</k>
        <env> ... X:Id|->tv(T1:Type, object(I:Int)) ...</env>
         <store> ... (object(I)|->(X1|->tv(T2:Type, object(I1:Int)) M:Map))
     		  object(I1)|->(N|->(X2:Id|->I3:MyInt M2:Map) M1:Map) ...</store>
	
	rule <k> X.X1[tv(_,N:Int)].X2=I3:MyInt =>. ...</k>
     <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	 <store> ... object(I1)|->(X1:Id|->tv(T2:Type, object(I2:Int)) M:Map)
	         object(I2)|->(N|->(X2|->(_=>I3) M2:Map) M1:Map)...</store>
			 
	
rule <k>X.X1[tv(T:Type, I1)][tv(T:Type, I2)]=tv(T:Type, I3)=>.K ... </k>
     <env> ... X:Id|->tv(_, object(N)) ... </env>
     <store> ... (object(N)|->(X1:Id|->tv(T2:Type, object(N1:Int)) M:Map))
	 object(N1)|->((I1, I2)|->(_=>tv(T:Type, I3)) M1:Map) ... </store>
	
rule <k>X.X1[tv(T:Type, I1)][tv(T:Type, I2)]=>tv(T:Type, I3) ... </k>
     <env> ... X:Id|->tv(_, object(N)) ... </env>
     <store> ... (object(N)|->(X1:Id|->tv(T2:Type, object(N1:Int)) M:Map))
	 object(N1)|->((I1, I2)|->tv(T:Type, I3) M1:Map) ... </store>	
		
rule <k> X.X1=tv(T:Type, I:Value) =>. ...</k>
     <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	 <store> ... object(I1)|->(X1|->(_=>tv(T:Type, I)) M:Map)...</store>
	when X1=/=K length
	
	
rule <k> X:Id.X1:Id=&tv(T:Type, object(I))=>. ... </k>
		<env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	 <store> ... object(I1)|->(X1|->(_=>tv(T:Type, object(I))) M:Map)...</store>
	when X1=/=K length

	
rule <k> X.X1=tv(T:Type, I:Int) =>. ...</k>
     <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	 <store> ... object(I1)|->(X1|->tv(T, (I2:Int=>I)) M:Map(.Map=>(I-Int 1|->tv(T, 0))))...</store>
	when X1==K length	andBool I-Int I2==Int 1  
		 
rule <k> X.X1=tv(T:Type, I:Int) =>. ...</k>
     <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	 <store> ... object(I1)|->(X1:Id|->tv(T, (I2:Int=>I)) ((M:Map (I2-Int 1|->tv(T, _)))=>M))...</store>
	when X1==K length	andBool I2-Int I==Int 1 		
		 
  
 rule <k> (X:Id=tv(T:Type, object(I:Int)))=>. ... </k>
       <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
      <store> ... (object(I:Int)|->M:Map) (object(I1)|->(M1:Map=>M))...</store>
  
/*rule <k>X:Id=M=>. ...</k>
     <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	 <store>... object(I1)|->(_=>M:Map)...</store>*/
		
rule <k> &X:Id=>&tv(T1:Type, object(I)) ...</k>
    <env> ... X|->tv(T1:Type, object(I)) ... </env>
		
		
rule <k> &X.X1=>&tv(T:Type, object(I)) ...</k>	
    <env> ... X:Id|->tv(T1:Type, object(I1)) ... </env>
	<store> ... object(I1)|->(X1:Id|->tv(T:Type, object(I)) M:Map) ...</store>
		
//		
rule <k> X:Id=&tv(T1:Type, object(I))=>. ... </k>

       <env> ... X:Id|->(_=>tv(T1:Type, object(I))) ...</env>
	
	/*	rule <k>X:Id=>M:Map ...</k>
		     <env>... X|->tv(T1:Type, object(I1:Int)) ...</env>
			 <store>...object(I1)|->(M)...</store>*/
		
		
		rule <k>X:Id=>tv(T1:Type, object(I1)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(tail|->tv(T:Type, I2:Int) head|->tv(T:Type, I3:Int) M:Map) ...</store> 
		 requires I2=/=Int I3
		 
		 rule <k>X:Id=>tv(struct treeNode, object(-1)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(tail|->tv(T:Type, I2:Int) head|->tv(T:Type, I3:Int) M:Map) ...</store> 
		 requires I2==Int I3
		 
		 
		 
		rule <k>X:Id=>tv(T1:Type, object(I1)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(key|->tv(T:Type, I2:Int) M:Map) ...</store> 
		// when I2=/=K object(-1)
		 
		 
		 	rule <k>X:Id=>tv(T2:Type, object(-1)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(key|->tv(T2:Type, object(-1)) M:Map) ...</store> 
		 //when I2=/=K object(-1)
		 
		 	 	rule <k>X:Id=>tv(T2:Type, object(-1)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(freq|->tv(T2:Type, object(-1)) M:Map) ...</store> 
		 //when I2=/=K object(-1)
		 
		 rule <k>X:Id=>tv(T1:Type, object(I1:Int)) ...</k>
		<env> ... X|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... object(I1)|->(height|->_ root|->I2:MyInt) ...</store> 
		 
		 
	  rule <k> X.X1.X2=>tv(T3:Type, object(I))...</k>
	  <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... (object(I1)|->(X1:Id|->tv(T2:Type, object(I2)) M:Map)) (object(I2)|->(X2:Id|->tv(T3:Type, object(I)) M1:Map))  ...</store> 
	  
	
    rule <k> X.X1.X2=I:MyInt=>. ...</k>
	  <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... (object(I1)|->(X1:Id|->tv(T2:Type,object(I2)) M:Map)) (object(I2)|->(X2:Id|->(_=>I) M1:Map))  ...</store> 

/*	rule <k> X.X1.X2.X3=I:MyInt=>. ...</k>
	  <env> ... X:Id|->tv(T1:Type, object(I1:Int)) ...</env>
	     <store> ... (object(I1)|->(X1:Id|->tv(T2:Type,object(I2)) M:Map)) (object(I2)|->(X2:Id|->(tv(T3:Type,object(I3))) M1:Map)) 
		 (object(I3)|->(X3:Id|->(_=>I) M1:Map))  ...</store> */

  
syntax KItem ::= mkDecls(Params,AriExps)  [function]

  rule mkDecls((T:Type X:Id, Ps:Params), (V:AriExp, Vs:AriExps))
    => T X~>X=V~> mkDecls(Ps,Vs)
	
  rule mkDecls(.Params,.AriExps) => .K

  rule <k>X:Id=>tv(T:Type, I)...</k>
	   <env>...X|->tv(T, N:Int)...</env>
	   <store>...N|->tv(T, I)...</store>
  
 rule <k> int X:Id=>. ...</k>
        <env> Rho => Rho[X <- tv(int, N:Int)] </env>
       <store>... .Map =>N |-> tv(int, 0) ...</store>
	    <nextLoc>N:Int=>N+Int 1</nextLoc>
	
 rule <k> char X:Id=>. ...</k>
     <env> Rho => Rho[X <- tv(char, N:Int)] </env>
       <store>... .Map =>N |-> tv(char, 0) ...</store>
	    <nextLoc>N:Int=>N+Int 1</nextLoc>
	   
 
  rule tv(int, I1:Int) - tv(int, I2) => I1 -Int I2
  rule tv(int, I1:Int) + tv(int, I2) => I1 +Int I2
  rule tv(int, I1) mod tv(int, I2) => I1 %Int I2  requires I2 =/=Int 0
  rule tv(int, I1) * tv(int, I2) => I1 *Int I2
  rule tv(int, I1) / tv(int, I2) => I1 /Int I2  requires I2 =/=Int 0
  rule tv(int, I1) ^tv(int, I2) => I1 ^Int I2
  rule lg tv(int, I:Int)=>Float2Int(logFloat(Int2Float(I,I,I)))
//rule tv(int, object(I1:Int)) + tv(int, I:Int)=>tv(int, I)
  
 rule <k> X:Id = tv(T:Type, I) => .K ...</k>
       <env>... X |-> tv(T:Type, N:Int) ...</env>
       <store>... N |-> tv(T:Type, (_ => I)) ...</store>
         
	  
 
	   
   rule <k> read() => tv(int, I) ...</k>
     <in> (ListItem(I:Int) => .List) ...</in>  
	 [read]
	 
	   rule <k> spawn S => !T:Int ...</k> <env> Rho </env>
       (.Bag => <thread>... <k> S </k> <env> Rho </env> <id> !T </id> ...</thread>)
	 
	 
	 
	   syntax Printable ::= Int | String | MyInt
/* currently it is necessary to subsort Printable to AExp,
  but future K should be able to infer that automatically. */
  syntax AriExp ::= Printable
  context print(HOLE:AriExp, AEs:AriExps)
  
  rule <k> print(P:Printable,AEs => AEs) ...</k>
       <out>... .List => ListItem(P) </out>  [print]
  rule print(.AriExps) => .  [structural]
  
  //rule 
	   
// BExp
 
  rule tv(T1:Type, I1:Value) != tv(T2:Type, I2:Value) => I1 =/=K I2
 rule tv(T1:Type, I1) == tv(T2:Type, I2) => I1 ==K I2
  rule tv(int, I1) > tv(int, I2) => I1 >Int I2
  rule tv(int, I1) < tv(int, I2) => I1 <Int I2
   rule tv(int, I1) <= tv(int, I2) => I1 <=Int I2
    rule tv(int, I1) >= tv(int, I2) => I1 >=Int I2
	rule tv(int, I1) | tv(int, I2)=>true when I2 %Int I1 ==Int 0
	rule tv(int, I1) | tv(int, I2)=>false when I2 %Int I1 =/=Int 0
	rule tv(int, object(-1)) < tv(int, I2)=>true
	
	
  rule true or _ => true
 rule false or B:BExp=>B
  rule true and B => B
  rule false and _ => false
  rule TRUE=>tv(bool, 1)
  rule FALSE=>tv(bool, 0)
 // rule tv(bool, 1) or true=>true
  //rule tv(bool, 0) or true=>false
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
  //syntax KItem ::="(" Type "," Id ")"
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
			   | "functionBody""(" Param"," Param"," Param"," Param "," Type"," Stmts")"
			   | "functionBody""(" Param"," Param"," Param"," Param "," Param "," Type"," Stmts")"
				 | "functionBody""(" Param"," Param"," Param"," Param "," Param "," Param "," Type"," Stmts")"
			   | "functionBody""(" Param"," Param"," Param"," Param "," Param "," Param "," Param ","Type"," Stmts")"


			   
rule <k>(T:Type F:Id(P1:Param) Ss:Stmts)=>.K ...</k>
   //  <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para></fun>)</funs>
	 <fun> ... .Map=>F|->functionBody(P1, T, Ss) ...</fun>
	requires F=/=K main

rule <k>(T:Type F:Id(P1:Param, P2:Param, P3:Param, P4:Param) Ss:Stmts)=>.K ...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, P3, P4, T, Ss) ...</fun> 
	requires F=/=K main	
rule <k>(T:Type F:Id(P1:Param, P2:Param, P3:Param, P4:Param, P5:Param) Ss:Stmts)=>.K ...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, P3, P4,P5, T, Ss) ...</fun> 
	requires F=/=K main	
	
rule <k>(T:Type F:Id(P1:Param, P2:Param, P3:Param, P4:Param, P5:Param, P6:Param) Ss:Stmts)=>.K ...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, P3, P4,P5, P6, T, Ss) ...</fun> 
	requires F=/=K main	
	
rule <k>(T:Type F:Id(P1:Param, P2:Param, P3:Param, P4:Param, P5:Param, P6:Param, P7:Param) Ss:Stmts)=>.K ...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, P3, P4,P5, P6, P7, T, Ss) ...</fun> 
	requires F=/=K main	
	
rule <k>(T:Type F:Id(P1:Param, P2:Param, P3:Param) Ss:Stmts)=>.K ...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, P3, T, Ss) ...</fun> 
	requires F=/=K main	

rule <k>(T:Type F:Id(P1:Param, P2:Param) Ss:Stmts)=>.K ...</k>
    // <funs>(FB:Bag=>FB<fun><fun-id>F</fun-id> <funBody> Ss</funBody><para>Ps</para><returns>.K</returns></fun>)</funs>
	<fun> ... .Map=>F|->functionBody(P1, P2, T, Ss) ...</fun> 
	requires F=/=K main	
	
	//rule .FunPgms | F1:MainId() B:Block =>F1:MainId() B:Block
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
	
	
		rule <k>(F1:Id(A1:MyInt, A2:MyInt, A3:MyInt, A4:MyInt)~>K) =>
		(P1:Param=A1~>P2:Param=A2~>P3:Param=A3~>P4:Param=A4~>Ss)</k>
<fstack> .List => ListItem((Env, .Map, K)) ...</fstack>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun> ...F1|->functionBody(P1, P2, P3, P4, _:Type, Ss:Stmts)
    ...</fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map</store>
	// <gstore>_=>STORE:Map </gstore>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main
	
rule <k>(F1:Id(A1:MyInt, A2:MyInt, A3:MyInt, A4:MyInt, A5:MyInt)~>K) =>
		(P1:Param=A1~>P2:Param=A2~>P3:Param=A3~>P4:Param=A4~>P5:Param=A5~>Ss)</k>
<fstack> .List => ListItem((Env, .Map, K)) ...</fstack>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun> ...F1|->functionBody(P1, P2, P3, P4,P5, _:Type, Ss:Stmts)
    ...</fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map</store>
	// <gstore>_=>STORE:Map </gstore>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main
	
	
rule <k>(F1:Id(A1:MyInt, A2:MyInt, A3:MyInt, A4:MyInt, A5:MyInt, A6:MyInt)~>K) =>
		(P1:Param=A1~>P2:Param=A2~>P3:Param=A3~>P4:Param=A4~>P5:Param=A5~>P6:Param=A6~>Ss)</k>
<fstack> .List => ListItem((Env, .Map, K)) ...</fstack>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun> ...F1|->functionBody(P1, P2, P3, P4,P5,P6, _:Type, Ss:Stmts)
    ...</fun>
	 <env> Env:Map=>.Map </env>
	 <store> STORE:Map</store>
	// <gstore>_=>STORE:Map </gstore>
	 <time>T:Int=>T+Int 1</time>
	requires F==K main
	
	
	rule <k>(F1:Id(A1:MyInt, A2:MyInt, A3:MyInt, A4:MyInt, A5:MyInt, A6:MyInt, A7:MyInt)~>K) =>
		(P1:Param=A1~>P2:Param=A2~>P3:Param=A3~>P4:Param=A4~>P5:Param=A5~>P6:Param=A6~>P7:Param=A7~>Ss)</k>
<fstack> .List => ListItem((Env, .Map, K)) ...</fstack>
	//rule <k>(F1:Id(Vs:AriExps) =>mkDecls(Ps, Vs)~>B)... </k>
     <tid>F</tid>
	// <fid>_=>F1</fid>
	 <fun> ...F1|->functionBody(P1, P2, P3, P4,P5,P6, P7, _:Type, Ss:Stmts)
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

rule <k>(return (F1:Id(A1:MyInt, A2:MyInt, A3:MyInt)))~>_=>F1:Id(A1:MyInt, A2:MyInt, A3)~>K</k>
<env>_=>Env</env>
//<store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	 
	 
	rule <k>(return (F1:Id(A1:MyInt, A2:MyInt, A3:MyInt, A4:MyInt)))~>_=>F1:Id(A1:MyInt, A2:MyInt, A3, A4)~>K</k>
<env>_=>Env</env>
//<store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>


rule <k>(return (F1:Id(A1:MyInt, A2:MyInt)))~>_=>F1:Id(A1:MyInt, A2:MyInt)~>K</k>
<env>_=>Env</env>
//<store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	 
	 rule <k>(return (F1:Id(A1:MyInt)))~>_=>F1:Id(A1:MyInt)~>K</k>
<env>_=>Env</env>
//<store> _=>STORE </store>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	

				  
rule ((I1:Id, I2:Id, I3:Id)=(N1:MyInt, N2:MyInt, N3:MyInt))=>I1=N1~>I2=N2~>I3=N3				  
rule ((I1:Id, I2:Id)=(N1:MyInt, N2:MyInt))=>I1=N1~>I2=N2


				  
	rule <k>(return (I1:MyInt, I2:MyInt, I3:MyInt))~>_ =>(I1, I2, I3)~>K</k>
  //   <fid>F</fid>
	 <env>_=>Env</env>
	// <store> _=>STORE </store>
	// <gstore> _=>STORE:Map </gstore>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	 
	 
	 rule <k>(return (I1:MyInt, I2:MyInt))~>_ =>(I1, I2)~>K</k>
	 <env>_=>Env</env>
	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	 
	 rule <k>(return (I1:MyInt, I2:MyInt, I3:MyInt, I4:MyInt))~>_ =>(I1, I2, I3, I4)~>K</k>

	 <env>_=>Env</env>

	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	
rule <k>(return (I:MyInt))~>_ =>I~>K</k>

	 <env>_=>Env</env>

	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	    

	 rule <k>(return (S:Set))~>_ =>S~>K</k>

	 <env>_=>Env</env>

	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
    
	
	
rule <k>(return; )~>_ =>K</k>

	 <env>_=>Env</env>

	 <fstack> ListItem((Env, STORE:Map, K)) => .List ...</fstack>
	 
////////////////////////////////////////////////////////	 
	 //pattern
	   syntax Tree ::= "node" "(" Int "," Tree "," Tree ")"
                | "leaf"
				| Value


  rule  GetValue<tv(T:Type, object(I:Int))> =>treeHeight(tv(T:Type, object(I:Int))) //[structural]
  
 rule <k> object(I:Int).N:Id=>tv(T:Type, object(I2:Int)) ...</k>
	      <store> ... object(I)|->(N|->tv(T:Type, object(I2)) _:Map) ...</store>
	
	 //syntax Int ::="tree_height" "(" MyInt ")" [function, strict(1), smtlib(smt_tree_height)]
	  syntax Int ::="treeHeight" "(" ReturnVal ")" [function, strict(1)]
				
	 rule treeHeight(tv(T:Type, object(I:Int)))=>treeHeight(object(I).right)

	    when I=/=Int -1

	 rule treeHeight(tv(T:Type, object(-1))) => 0

	


endmodule
