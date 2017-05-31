require "alg-syntax.k"


module ALG-CONFIGURATION
  imports ALG-SYNTAX
  syntax KResult ::= Int | Bool | String

  
  configuration <T color="yellow">
  // thread
  <threads>
  <thread multiplicity="*">
  <fid>.K</fid>
  <tid>.K</tid>
  <k> $PGM:Pgm</k>
  //<control>
  <fstack>.List</fstack>
  <xstack>.List</xstack>
  <env>.Map</env>
  //<return> void </return>
  </thread>
  </threads>
  
  //array
      <arrayStore>
              <array  multiplicity="*">
                <arrayId> .K </arrayId>
                <arrayType> .K </arrayType>
                <arraystore > .Map </arraystore>
				<arrayLen>0</arrayLen>
              </array>
      </arrayStore>
	  
	  //object
	  <objectStore>
	  <object  multiplicity="*">
	  <objectId>.K</objectId>
	  <objectType>.K</objectType>
	  <layer  multiplicity="*">
	  <layerClass>.K</layerClass>
	  <layerEnv>.Map</layerEnv>
	  </layer>
	  </object>
	  </objectStore>
	  
	  //functionCall
	  <funs>
	  <fun multiplicity="*">
	  <fun-id> .K</fun-id>
	  <funBody>.K</funBody>
	  <para>.AriExps</para>
	  <returns>.K</returns>
	  </fun>
	  </funs>
	  
	  //global
	  <genv>.Map</genv>
	  <store>.Map</store>
	  
       //Standard input and output
	   <in color="magenta" stream="stdin"> .List </in>
       <out color="Orchid" stream="stdout"> .List </out> 
		<time>0</time>
		 <nextLoc color="gray"> 0 </nextLoc>
                </T>
endmodule