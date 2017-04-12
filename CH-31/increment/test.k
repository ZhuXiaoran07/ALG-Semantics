module TEST-SYNTAX
syntax Int ::="<" Id "," Int ">"

syntax AExp  ::= Int | Id
                 | AExp "/" AExp              [left, strict]
                 > AExp "+" AExp              [left, strict]
                 | "(" AExp ")"               [bracket]

syntax Stmt ::= "int" Id ";"
			  |  Id "=" AExp ";"            [strict(2)]
syntax Stmts::=List{Stmt, ""}
syntax Type ::="int"

endmodule

module TEST
imports TEST-SYNTAX
syntax KResult ::=Int

configuration <T color="yellow">
                  <k color="green"> $PGM:Stmts </k>
                  <state color="red"> .Map </state>
				  </T>
				  
rule <k> X:Id => I ...</k> <state>... <X, I:Int> |->int ...</state>

rule <k> int X:Id;=>. ... </k> 
<state> Rho:Map (.Map => <X, 0>|->int) </state> 
    requires notBool (X in keys(Rho))
	
rule <k> X = I:Int; => . ...</k> <state> ... <X, _=>I>|->int...</state>
 rule S1:Stmt S2:Stmt => S1 ~> S2  [structural]	
	
endmodule