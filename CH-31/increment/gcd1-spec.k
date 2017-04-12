module GCD-SPEC
imports ALG1
rule 
<k>
(GCD(M:Int,N:Int)
=>
.K)
...
</k>
<env>

a|->LA:Int
b|->LB:Int

</env>
<store>
LA|->(A:Int=>?A1:Int)
LB|->(B:Int=>?B1:Int)
</store>
<tid>_=>.K</tid>
<fid>_=>.K</fid>
 <funs> 
 FUNS:Bag
 </funs>
<time>T:Int=>T1</time>
requires  M>Int 0 andBool N>Int 0

ensures T1-Int T<=Int M+Int N



/* replaced M:Int, N:Int with a and b which are tokens defined in the semantics file. The reason to do this modification is that according to the rule in the semantics file, when the function gcd(a-b, b) is called, it cannot be rewritten to gcd(A-Int B, B), but to a-b=A-Int B~>b=B~> FB (FB stands for the function body of gcd). 
rule
<k>
(GCD(M:Int,N:Int)  
=>
GCD(M-Int N, N))
...
</k>
<env>
ENV:Map
</env>
<store>
STORE:Map </store>
<tid>_=>_ </tid>
<fid>_=>_ </fid>
 <funs> 
 FUNS:Bag
 </funs>
<time>T:Int=>T+Int 1</time>
requires  N>Int 0  andBool M >Int N */
//ensures (T1-Int T >=Int 0 )

/*rule
<k>
(GCD(M:Int,N:Int)
=>
GCD(M, N -Int M))
...
</k>
<env>

ENV:Map=> _
</env>
<store>
STORE:Map=>_
</store>
<tid>_=>_</tid>
<fid>_=>_</fid>
 <funs> 
 FUNS:Bag
 </funs>
<time>T:Int=>T+Int 1</time>
requires  M>Int 0 andBool N>Int 0 andBool N >Int M
//ensures T1-Int T<=Int M+Int N

/*rule
<k>
(GCD(M:Int,M:Int)
=>
.K)
...
</k>
<env>

ENV:Map=> _
</env>
<store>
STORE:Map=>_
</store>
<tid>_=>_</tid>
<fid>_=>_</fid>
 <funs> 
 FUNS:Bag
 </funs>
<time>T:Int=>T1 </time>
requires  M>Int 0 
ensures T1-Int T<=Int M*/





 endmodule