module ALG-SYNTAX
syntax FunctionId ::= "INSERTION-SORT"  [token]  
			| "MERGE-SORT"      [token]
			| "MERGE"           [token]
			| "FIND-MAX-CROSSING-SUBARRAY" [token]
			| "FIND-MAXIMUM-SUBARRAY" [token]
			| "left-low"	[token]
			| "left-high"	[token]
			| "left-sum"	[token]
			| "right-low"	[token]
			| "right-high"	[token]
			| "right-sum"	[token]
			| "cross-low"	[token]
			| "cross-high"	[token]
			| "cross-sum"	[token]
			| "max-left"	[token]
			| "max-right"	[token]
			| "MAX-HEAPIFY" [token]
			| "BUILD-MAX-HEAP" [token]
			| "HEAP-EXTRACT-MAX" [token]
			| "heap-size"	[token]
			| "HEAP-INCREASE-KEY" [token]
			| "MAX-HEAP-INSERT"  [token]
			| "QUICKSORT"	[token]
			| "PARTITION"	[token]
			| "RANDOMIZED-PARTITION"	[token]
			| "RANDOMIZED-QUICKSORT"	[token]
			| "COUNTING-SORT"	[token]
			| "RANDOMIZED-SELECT" [token]
			| "STACK-EMPTY"  [token]
			| "LIST-SEARCH"  [token]
			| "LIST-INSERT"  [token]
			| "LIST-DELETE"  [token]
			| "LIST-SEARCH'" [token]
			| "LIST-INSERT'" [token]
			| "LIST-DELETE'" [token]
			| "ALLOCATE-OBJECT"  [token]
			| "FREE-OBJECT"  [token]
			| "COMPACT-LIST-SEARCH" [token]
			| "COMPACT-LIST-SEARCH'" [token]
			| "DIRECT-ADDRESS-SEARCH" [token]
			| "DIRECT-ADDRESS-INSERT" [token]
			| "DIRECT-ADDRESS-DELETE" [token]
			| "HASH-INSERT" [token]
			| "HASH-SEARCH" [token]
			| "INORDER-TREE-WALK" [token]
			| "TREE-SEARCH" [token]
			| "ITERATIVE-TREE-SEARCH" [token]
			| "TREE-MINIMUM" [token]
			| "TREE-MAXIMUM" [token]
			| "TREE-SUCCESSOR" [token]
			| "TREE-INSERT" [token]
			| "TREE-DELETE" [token]
			| "LEFT-RPTATE" [token]
			| "RB-INSERT" [token]
			| "RB-INSERT-FIXUP" [token]
			| "LEFT-ROTATE" [token]
			| "RIGHT-ROTATE" [token]
			| "RB-TRANSPLANT" [token]
			| "RB-DELETE" [token]
			| "y-original-color" [token]
			| "RB-DELETE-FIXUP" [token]
			| "OS-SELECT" [token]
			| "OS-RANK" [token]
			| "INTERVAL-SEARCH" [token]

	syntax PgmId::=	SizeId |StackId |QueueId |Id |FunctionId 
 	syntax ArrayId::="key" [token]	
					 |"next" [token]
 syntax AExp  ::= Int | String | PgmId 
				 | ArrayId "[" AExp "]"            [strict(2)]
				 | ArrayId "["FunctionCall "]"     [strict(2)]
				 | ArrayId "[]"
                 > AExp "/" AExp              [left, strict, division]
				 | AExp "%" AExp              [left, strict]
				 | AExp "*" AExp              [left, strict]
                 > AExp "+" AExp              [left, strict]
				 |  AExp "-" AExp              [left, strict(2)]
                 > PgmId "=" AExp                [strict(2)]
				 | SizeId "=" AExp	          [strict(2)]
				 | StackId "="AExp			  [right, strict(2)]
				 | "(" Ids ")" "=" AExps	  [strict(2)]
				 | "("Ids ")""=" FunctionCall        [strict(2)]
				 | PgmId "=" FunctionCall        [strict(2)]
				 | ArrayId "[" AExp "]" "=" AExp              [strict(3,2)]
				 | ArrayId "[" FunctionCall "]" "=" AExp              [strict(3,2)]
                 | "(" AExp ")"               [bracket] 
				 | AExp ".." AExp
syntax SizeId ::= Id".""length"
				| Id".""size"
			 | HeapId".""heap-size"
syntax HeapId::=Id
syntax BExp  ::= Bool 
                 | AExp "<=" AExp             [seqstrict, latex({#1}\leq{#2})]
				 |  AExp "<" AExp             [seqstrict, latex({#1}\leq{#2})]
				 | AExp "==" AExp             [seqstrict, latex({#1}\leq{#2})]
				 | AExp "!=" AExp             [seqstrict, latex({#1}\leq{#2})]
				 | AExp ">=" AExp             [seqstrict, latex({#1}\leq{#2})]
				 | AExp ">" AExp             [seqstrict, latex({#1}\leq{#2})]
				 | AExp "does not overlap" AExp
                 | "!" BExp                   [strict]
                 > BExp "and" BExp             [left, strict(1)]
				 |  BExp "or" BExp             [left, strict(1)]
               | "(" BExp ")"               [bracket]
  syntax Block ::= "{" Stmts "}"
  syntax Stmt  ::= Block
				 | AExp
				 | BExp
                 | Int "" AExp               [strict(2)]
                 | Int "if"  BExp 
                   Block Int "else" Block         [strict(2)]
				 | Int "if"  FunctionCall 
                   Block Int "else" Block         [strict(2)]
				 | Int "if" BExp Block            [strict(2)]
				 | Int "if"  BExp 
                   Block Int "elseif" BExp Block
				   Int "else" Block [strict(2)]
				 
                 | Int "if"  BExp 
                   Block Int "elseif" BExp Block [strict(2)]
				 | Int "while"  BExp  Block
				 | Int "return" AExp  
				 | "return" AExp
				 | Int "return" FunctionCall [strict(2)]
				 |  "return" FunctionCall
				 | Int "repeat" Block Int "until" BExp
				 | Int "for" AExp "to" AExp "{"Stmts"}"  [strict(2,3)]
				 | Int "for" AExp "downto" AExp "{"Stmts"}"  [strict(2,3)]
				 | Int "let" AExp "and" AExp "be new arrays"
				 | Int "let" AExp "be a new array"
				 | Int FunctionCall
				 | FunctionCall Stmts
				 | Int "return" "(" AExps ")"
				 | "return" "(" AExps ")"
				 | "exchange" AExp "with" AExp
				 | "return" Bool
				 | Int "print" AExps 
				 

syntax Bool ::="FALSE" | "TRUE"
syntax StackId::=Id
				|StackId".""top"
				
syntax QueueId::=Id
				| QueueId".""tail"
				//| QueueId".""length"
				//| QueueId".""head"
				
// listId.head && queueId.head?
syntax Id::=Id".""nil"
			   |Id".""next"
			   |Id".""prev"
			   |Id".""head"
			   |Id".""key"
			   |Id".""left"
			   |Id".""right"
			   |Id".""p" //p292
			   |Id".""root"
			   |Id".""nil"
			   |Id".""color"
			   |Id".""int"
			   |Id".""max"
			   |Id".""low"


syntax SChar ::=  '\n' [token]
 syntax ArrayId ::=Id
 syntax Stmts ::= List{Stmt,""}
   syntax Ids   ::= List{Id,","}
  syntax AExps ::= List{AExp,","}
syntax FunctionCall::=FunctionId "(" AExps ")"  
syntax FunctionId::=Id
syntax KeyWords::="NIL" | "INT_MAX" | "INT_MIN" |"then"
syntax Id::=KeyWords
syntax Pgm::= Stmts
//syntax FunctionValue::=Id "(" AExps ")"
   /*syntax ErrorType::=" 'heap underflow' "
					 | "new key is smaller than current key"
					 | "underflow"*/
   syntax String::="Error" String
				  | "error" String
				  | "same as then clause with" String "and" String "exchanged" 
   
endmodule


module ALG
  imports ALG-SYNTAX
  syntax KResult ::= Int | Bool
  
  configuration <T color="yellow">
                  <k color="green"> $PGM:Pgm </k>
                  <state color="red"> .Map </state>
                </T>


endmodule
