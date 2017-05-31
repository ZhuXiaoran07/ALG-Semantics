module ALG-SYNTAX

syntax MainId ::= "main"   [token]

	
 	syntax Id::= Id"<"AriExp">"
			  // | AriExp"."AriExp
			  | Id "." Id
			   | "(" Id "," Id ")""."Id
			   | Id"'"
			//   | MainId
			   
			  
	syntax SET::="{" Symbols"}"
				| Id
				| "|" Id "INTERSECT" Id "|"
				| SET "SUNION" SET
				| SET "SUNION" FunctionCall
				| "EMPTY"
	syntax Array::=  Id "[" AExp "]"     [strict(2)]
				|  Id "[" Symbol "]"            [strict(2)]
				 | Id "[" AriExps "]" "["AriExps"]"           [strict(2,3)]
	syntax Symbol::= FunctionCall
				> Int | String | Id | KeyWords | SizeId
				| Array
				 | SET
				 | "|" Symbol "|"
				 | "(" Id "," Id ")"
 syntax AExp  ::=  SizeId | String | "read" "(" ")"
				| "lg" Symbol
				| Symbol "*"
				  | AriExp "/" AriExp              [left, strict, division]
				 | AriExp "mod" AriExp             [left, strict]
				 | AriExp "*" AriExp              [left, seqstrict]
                 > AriExp "+" AriExp              [left, seqstrict]
				 |  AriExp "-" AriExp              [left, seqstrict]
				 
				| Id "=" Array                [strict(2)]
				 | Id "[" AriExp "]" "=" AriExp     [strict(2, 3)]
				 | Id "=" AExp     [strict(2)]
				|  Id "=" Int     [strict(2)]
				 | Symbol "=" "<" Symbol ">"
				 | "(" Symbols ")" "=" "(" AriExps ")" [strict(2)]
				// | SizeId "=" Symbol	          [strict(2)]
				// | StackId "="Symbol			  [right, strict(2)]
				 | "(" Ids ")" "=" AExps	  [strict(2)]
				 | "("Symbols ")""=" FunctionCall        [strict(2)]
				 | Symbol "=" "(" Ids ")"
                 //| "(" Symbol ")"               [bracket] 
				 | "1" ".." AExp
				 | AriExp "^" AriExp
				// | AriExp "mod" AriExp
				 | AriExp "||" AriExp
				 | AriExp "&&" AriExp
                 | "(" AExp ")"               [bracket] 
				 //| AExp ".." AExp
				 //| Symbol ".." AExp
				 //| AExp ".." Symbol
				 | "spawn" FunctionCall
				 | 	"SIGMA" "(" AriExp ")" "(" AExp ")" "(" AExp ")"
				 | Symbol "=" BExp 				[left, strict(2)]
				 
syntax BExp  ::= Bool 
				// | Symbol "<" Symbol
                 | AriExp "<=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 |  AriExp "<" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "==" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "!=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp "<=" AriExp "<=" AriExp
				 | AriExp ">=" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | AriExp ">" AriExp             [seqstrict, latex({#1}\leq{#2})]
				 | Symbol "==" "TRUE"
				 | Symbol "==" "FALSE"
				 | BExp "==" "TRUE"
				 | BExp "==" "FALSE"
                 | "!" BExp           [strict]
				 | "not" BExp
                 > BExp "and" BExp         [left, strict(1)]
				 |  BExp "or" BExp             [left, strict(1)]
               | "(" BExp ")"               [bracket]
			   | AriExp "|" AriExp
			   | AriExps "does not overlap" AriExps
			   //| FunctionCall
syntax IfStmt::= "if"  BExp Stmt "else" Stmt         [strict(1)]
				 |  "if"  BExp Block "else" Block         [strict(1)]
				 |  "if"  BExp Block "else" Stmt         [strict(1)]
				 |  "if"  FunctionCall 
                   Block "else" Block         [strict(1)]
				 | "if" BExp  Stmt           [strict(1)]
				 | "if" BExp Block    [strict(1)]
				 |  "if"  BExp 
                   Block "elseif" BExp Block
				    "else" Block [strict(1)]
				|   "if"  BExp 
                   Block "elseif" BExp Stmt
				    "else" Stmt [strict(1)]
			     |  "if"  BExp 
                   Stmt "elseif" BExp Stmt
				    "else" Stmt[strict(1)]
			     | "if" BExp Stmt "elseif" BExp Stmt "else" Block  [strict(1)]
				| "if" BExp  Stmt  "else" Block [strict(1)]
					
				| "if"  BExp 
                   Block "elseif" BExp Block [strict(1)]
				| "if" BExp Block "elseif" BExp Block "elseif" BExp Block

				  
syntax ForStmt::= "for" "(" Stmt BExp Stmt ")" Block
				 |"for" BExp Block [strict(1)]
				 | "for" BExp Stmt [strict(1)]
				 | "for" Id "=" Symbol "to" Symbol Block [strict(2,3)]
				 | "for" Id "=" Symbol "to" Symbol Stmt  
				// | "for" AriExp" to" AriExp Block [strict]
				// | "for" AriExp "to" AriExp Stmt
				  | "for" AExp "to" AExp "by" Id   [strict(1,2)]
				 |  "for" AriExp "downto" AriExp Block  [strict(1,2)]
				 | "for" AriExp "downto" AriExp Stmt  [strict(1,2)]
				 | "for" "each character" Id "belongsto" Id Block			 

				 
syntax LetStmt::=  "let" Symbol "and" Symbol "be new arrays"
				 |  "let" Symbol "be a new array"
				 | "let" AriExp "be a new" AExp "matrix"
				 |  "let" AriExp "and" AriExp "be new" AExp "matrices"
				 | "let" Symbols "and" Symbol "be new tables"
				  | "let" Symbol "be a new table"
				  | "let" Symbol "be a new vector of length" Symbol
				  | "let" Symbol "and" Symbol "be such that" BExp "," Symbol "is odd"",""and" AExp
				 | "let" "<" AriExp"," AriExp"," "..." "," AriExp ">" "be the binary representation of" Id
				  | "let" AriExp "be an arbitrary edge of" AriExp
				 | "let" AriExp "be the largest value in" AriExp
syntax InitialStmt::= "initialize" Symbol "with" Int"s below the diagonal"
				  | "initialize" Symbol "with" Int"s on the diagonal and" Int"s above the diagonal"
				  | "allocate a new node" Id
				  | "create a root list for" AriExp "containing just" AriExp
				   | "allocate" Symbol "with" AriExp "slot"
				 | "allocate" AriExp "with" AExp "slots"
				 
  syntax Block ::="{" Stmts "}"
  syntax Stmt  ::= Block 
				  | AExp
				 | BExp  
				 | FunctionCall 
				 | "sync"
				 | "parallel" Stmt
				 | IfStmt
				 | ForStmt
				 | LetStmt
	  			 | InitialStmt
				 | "int" Id"["Symbol"]"
				 | "while" BExp Stmt   
				 |  "while"  BExp  Block   
				// | "return"
				| "return" "("Id"(" AriExps ")"")"
				 > "return" "(" AriExps ")"
				 | "return" AriExps
				 | "return" Ids  
				 | "repeat" Block  "until" BExp
				 | "repeat" Stmt "until" BExp
				 
				| "move" Id "to the front of list" Id
				 | "exchange" AriExp "with" AriExp
				 | "return" Bool
				 |  "print" AriExps 
				 | "print" String 
				 | "print" String AriExp
				 | "return" Symbol "and" Symbol
				 
				 | "insert" AriExp "into H's root list"
				 | "concatenate the root list of" AriExp "with the root list of" AriExp
				 | "sort the edges of" AriExp "into nondecreasing order"
				 | "find an edge" AriExp "that is safe for" Id
				 | "remove from" AriExp "every element that is greater than" AriExp
				 | "remove from" AriExp "every edge incident on either" Id "or" Id
				 | "remove" Id "from the root list of" Id
				 | "remove" Id "from the child list of" Id
				 
				 | "select an" Id "belongsto" Id "that maximizes" SET
				 | "sort" Id "," "using" Id "as sort keys"
				 | "swap" Symbol "with" Symbol
				 | "topologically sort the vertices of" Symbol
				 | "make" Id "a child of" Id ", incrementing" Id
				 | "decrementing" Id
				 | "add" Id "to the list of" Id
				 | "hire candidate" Id
				
				 | "insert all items in" Symbol 
				 | "free" Symbol
				 | "insert" Id "into" Symbol
				 | "partition" Ids ", and" Id "into" AriExp "submatrices"
				//  > "{" Stmts "}"  [bracket]
 				
				 
	
			
				 
syntax BExp ::= "each edge" "(" Id "," Id")" "belongsto" Id
			 | "there exists a path" Id "from" Id "to" Id "in the residual network" Id
			 | "each edge" "(" Id "," Id")" "in" Id
			 | "(" Id "," Id")" "belongsto" Id
			 | "each vertex" Id "belongsto" AriExps
			 | "each" Id "belongsto" AriExp
			 | "each node" Id "in the root list of" Id
			 | "each edge" Id "belongsto" Id "taken in nondecreasing order by weight"
			 | "each vertex" Id ", taken in topologically sorted order"
			 | AriExp "belongsto" AriExp
			 | Id "does not form a spanning tree"
			 
syntax Bool ::="FALSE" | "TRUE"
syntax StackId::=Id
				|StackId".""top"
				
syntax QueueId::=Id
				| QueueId".""tail"


syntax SizeId ::=  Id".""size"
			 | Id".""heap-size"
			 |Id".""length"
syntax Ints::=List{Int, ","}
 syntax ArrayId ::=Id
 syntax Stmts ::= List{Stmt,""}
   syntax Ids   ::= List{Id,","}
  syntax AExps ::= List{AExp,","}
  syntax Symbols::=List{Symbol, ","}
syntax AriExp::=AExp | Symbol
syntax AriExps::=List{AriExp, ","}
syntax FunctionDef::= Type FunctionCall
syntax Type::="int" | "void" | "bool"
syntax Param::=AriExp
syntax Params::=List{Param, ","}
syntax FunctionCall::= Id "(" AriExps ")"  //[right]
					 | Symbol "(" BExp ")"
syntax KeyWords::="NIL" |"then" | "INFINITY" | "+ infinity" |"-INFINITY"
syntax Id::=KeyWords
syntax Sep::= "|"
   syntax String::="Error" String
				  | "error" String
				  | "same as then clause with" String "and" String "exchanged" 
	syntax MainPgm::=MainId "("Params")" Block	
syntax FunPgm::=FunctionDef Stmts
syntax FunPgms::=List{FunPgm, ""}
syntax Pgm ::= FunPgms Sep MainPgm
syntax KItem ::= "execute"

syntax Id::="a"   [token]
		   | "b"  [token]
		   | "t"   [token]
		   | "m"  [token]
		   | "n"  [token]
		  // | "main" [token]
				  
endmodule
