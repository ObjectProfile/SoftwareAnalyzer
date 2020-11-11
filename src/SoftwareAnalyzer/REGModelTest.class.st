Class {
	#name : #REGModelTest,
	#superclass : #REGTest,
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #examples }
REGModelTest >> codeCPP [

^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C++" filename="main.cpp"><comment type="line">// classes example</comment>
<cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;iostream&gt;</cpp:file></cpp:include>
<using>using <namespace>namespace <name>std</name>;</namespace></using>

<class>class <name>Rectangle</name> <block>{<private type="default">
    <decl_stmt><decl><type><name>int</name></type> <name>width</name></decl>, <decl><type ref="prev"/><name>height</name></decl>;</decl_stmt>
  </private><public>public:
    <function_decl><type><name>void</name></type> <name>set_values</name> <parameter_list>(<parameter><decl><type><name>int</name></type></decl></parameter>,<parameter><decl><type><name>int</name></type></decl></parameter>)</parameter_list>;</function_decl>
    <function><type><name>int</name></type> <name>area</name><parameter_list>()</parameter_list> <block>{<block_content><return>return <expr><name>width</name><operator>*</operator><name>height</name></expr>;</return></block_content>}</block></function>
</public>}</block>;</class>

<function><type><name>void</name></type> <name><name>Rectangle</name><operator>::</operator><name>set_values</name></name> <parameter_list>(<parameter><decl><type><name>int</name></type> <name>x</name></decl></parameter>, <parameter><decl><type><name>int</name></type> <name>y</name></decl></parameter>)</parameter_list> <block>{<block_content>
  <expr_stmt><expr><name>width</name> <operator>=</operator> <name>x</name></expr>;</expr_stmt>
  <expr_stmt><expr><name>height</name> <operator>=</operator> <name>y</name></expr>;</expr_stmt>
</block_content>}</block></function>

<function><type><name>int</name></type> <name>main</name> <parameter_list>()</parameter_list> <block>{<block_content>
  <decl_stmt><decl><type><name>Rectangle</name></type> <name>rect</name></decl>;</decl_stmt>
  <expr_stmt><expr><call><name><name>rect</name><operator>.</operator><name>set_values</name></name> <argument_list>(<argument><expr><literal type="number">3</literal></expr></argument>,<argument><expr><literal type="number">4</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
  <expr_stmt><expr><name>cout</name> <operator>&lt;&lt;</operator> <literal type="string">"area: "</literal> <operator>&lt;&lt;</operator> <call><name><name>rect</name><operator>.</operator><name>area</name></name><argument_list>()</argument_list></call></expr>;</expr_stmt>
  <expr_stmt><expr><name>cout</name> <operator>&lt;&lt;</operator> <literal type="string">"\n"</literal></expr>;</expr_stmt>
  <return>return <expr><literal type="number">0</literal></expr>;</return>
</block_content>}</block></function>

</unit>
'
]

{ #category : #examples }
REGModelTest >> codeCppLint [
^ 'Ignoring /Users/alexandrebergel/Dropbox/GitRepos/u-vent/Bambu_ventilator.ino; not a valid file name (cuh, cxx, cu, hpp, cc, c, hxx, hh, h++, cpp, h, c++)
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:1:  Weird number of spaces at line-start.  Are you using a 2-space indent?  [whitespace/indent] [3]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:1:  Line ends in whitespace.  Consider deleting these extra spaces.  [whitespace/end_of_line] [4]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:9:  Use int16/int64/etc, rather than the C type long  [runtime/int] [4]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:10:  Use int16/int64/etc, rather than the C type long  [runtime/int] [4]'
]

{ #category : #examples }
REGModelTest >> codeExample [

^'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" revision="1.0.0">

<unit xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="main.c" hash="e2d0f7ce5cefebadcf4ee32889129453c60aaf16"><cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;stdio.h&gt;</cpp:file></cpp:include>

<cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>"myOtherModule.h"</cpp:file></cpp:include>

<function><type><name>int</name></type> <name>main</name><parameter_list>()</parameter_list> <block>{<block_content>
  <expr_stmt><expr><call><name>printf</name><argument_list>(<argument><expr><literal type="string">"Hello World!\n"</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
  <return>return <expr><literal type="number">0</literal></expr>;</return>
</block_content>}</block></function>
</unit>

<unit xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="myOtherModule.c" hash="3eda10fdf9dc0fd6d6ac778fb6ae2bda1aea9083"><cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;stdio.h&gt;</cpp:file></cpp:include>

<cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>"myOtherModule.h"</cpp:file></cpp:include>


<comment type="block">/*
   this is a comment
*/</comment>

<function><type><name>void</name></type> <name>foo</name><parameter_list>(<parameter><decl><type><name>void</name></type></decl></parameter>)</parameter_list> <block>{<block_content>
  <expr_stmt><expr><call><name>printf</name><argument_list>(<argument><expr><literal type="string">"Hello World!\n"</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
</block_content>}</block></function>
</unit>

<unit xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="myOtherModule.h" hash="1f0eb46e6820e7c193fdb8d7953f90016894cf01"><cpp:ifndef>#<cpp:directive>ifndef</cpp:directive> <name>MYOTHERMODULE_H</name></cpp:ifndef>
<cpp:define>#<cpp:directive>define</cpp:directive> <cpp:macro><name>MYOTHERMODULE_H</name></cpp:macro></cpp:define>

<function_decl><type><name>void</name></type> <name>foo</name><parameter_list>(<parameter><decl><type><name>void</name></type></decl></parameter>)</parameter_list>;</function_decl>

<cpp:endif>#<cpp:directive>endif</cpp:directive></cpp:endif>

</unit>

</unit>
'
]

{ #category : #examples }
REGModelTest >> codeMain [

^ '#include <stdio.h>

#include "myOtherModule.h"

int main() {
  printf("Hello World!\n");
  return 0;
}
'
]

{ #category : #examples }
REGModelTest >> codeModuleA [

	^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="a/moduleA.c"><cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;moduleB.h&gt;</cpp:file></cpp:include>

<function><type><name>void</name></type> <name>main</name><parameter_list>()</parameter_list> <block>{<block_content>
</block_content>}</block></function>
</unit>
'
]

{ #category : #examples }
REGModelTest >> codeModuleB [

	^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="b/moduleB.c"><cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;moduleB.h&gt;</cpp:file></cpp:include>

<function><type><name>void</name></type> <name>foo</name><parameter_list>()</parameter_list> <block>{<block_content>
  <expr_stmt><expr><call><name>zork</name><argument_list>()</argument_list></call></expr>;</expr_stmt>
</block_content>}</block></function>
</unit>
'
]

{ #category : #examples }
REGModelTest >> codeModuleB_h [

	^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" revision="1.0.0" language="C" filename="b/moduleB.h"><comment type="line">// Header moduleB.h</comment>
</unit>
'
]

{ #category : #examples }
REGModelTest >> codeMyOtherModule [

^ '#ifndef MYOTHERMODULE_H
#define MYOTHERMODULE_H

void foo(void);

#endif

'
]

{ #category : #examples }
REGModelTest >> codeMyOtherModuleC [

^ '#include <stdio.h>

#include "myOtherModule.h"


/*
   this is a comment
*/

void foo(void) {
  printf("Hello World!\n");
}
'
]

{ #category : #examples }
REGModelTest >> codeVerySimpleWith3Functions [
"#include <stdio.h>

void f(void) {
    printf(""Hello "");
}

void g(void) {
    printf(""World!\n"");
}


int main(void) {
  f();
  g();
  return 0;
}
"

^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="main.c"><cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;stdio.h&gt;</cpp:file></cpp:include>

<function><type><name>void</name></type> <name>f</name><parameter_list>(<parameter><decl><type><name>void</name></type></decl></parameter>)</parameter_list> <block>{<block_content>
    <expr_stmt><expr><call><name>printf</name><argument_list>(<argument><expr><literal type="string">"Hello "</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
</block_content>}</block></function>

<function><type><name>void</name></type> <name>g</name><parameter_list>(<parameter><decl><type><name>void</name></type></decl></parameter>)</parameter_list> <block>{<block_content>
    <expr_stmt><expr><call><name>printf</name><argument_list>(<argument><expr><literal type="string">"World!\n"</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
</block_content>}</block></function>


<function><type><name>int</name></type> <name>main</name><parameter_list>(<parameter><decl><type><name>void</name></type></decl></parameter>)</parameter_list> <block>{<block_content>
  <expr_stmt><expr><call><name>f</name><argument_list>()</argument_list></call></expr>;</expr_stmt>
  <expr_stmt><expr><call><name>g</name><argument_list>()</argument_list></call></expr>;</expr_stmt>
  <return>return <expr><literal type="number">0</literal></expr>;</return>
</block_content>}</block></function>
</unit>
'
]

{ #category : #tests }
REGModelTest >> testAddExample [

	| m |
	m := REGModel new.
	m addSrcMLXML: self codeExample.
	
	self assert: m numberOfModules equals: 2.	
		
	self assert: m modules size equals: 2.
	self assert: m modules first filename equals: 'main.c'.
	self assert: m modules second filename equals: 'myOtherModule.c'.
	self assert: m modules first functions size equals: 1.
	
	self assert: m numberOfFunctions equals: 2.
	self assert: m numberOfHeaders equals: 1.
	
	self assert: m modules first numberOfLinesOfCode equals: 9.
	self assert: m numberOfLinesOfCode equals: 30.
	
	self assert: (m units allSatisfy: [ :u | u model == m ])
]

{ #category : #tests }
REGModelTest >> testAddExampleAndBuildArchitecture2 [

	| m lA lB mA mB mBh |
	m := REGModel new.
	m addSrcMLXML: self codeModuleA.
	m addSrcMLXML: self codeModuleB.
	m addSrcMLXML: self codeModuleB_h.
	
	self assert: m numberOfLayers equals: 0.
	m buildFileDependencies.
	self assert: m numberOfLayers equals: 0.
	
	self assert: m numberOfUnits equals: 3.
	
	m buildArchitecture.
	self assert: m numberOfLayers equals: 2.
	
	self assert: (m layers collect: #name as: Array) equals: { 'a' . 'b' }.
	
	lA := m layers first.
	lB := m layers second.
	
	mA := lA modules first.
	mB := lB modules first.
	mBh := lB headers first.
	
	self assert: mA layer equals: lA.
	self assert: mB layer equals: lB.
	
	self assert: mA numberOfIncludes equals: 1.
	self assert: mA outgoingUnits size equals: 1.
	self assert: (mA outgoingUnits includes: mBh).
	

	
	self assert: lA outgoingLayers size equals: 1.
	self assert: (lA outgoingLayers includes: lB).
	
	self assert: lB outgoingLayers size equals: 1.
	self assert: (lB outgoingLayers includes: lB).
	

	self assert: (lA numberOfOutgoingUnitsToward: lB) equals: 1.
	self assert: (lB numberOfOutgoingUnitsToward: lA) equals: 0.
]

{ #category : #tests }
REGModelTest >> testCPP [

	| m moduleMain |
	m := REGModel new.
	m addSrcMLXML: self codeCPP.

	moduleMain := m modules first.
	self assert: moduleMain filename equals: 'main.cpp'.
	self assert: (moduleMain numberOfIncludes) equals: 1.
	self assert: (moduleMain includes collect: #name) asArray equals: #('<iostream>').
	m buildFileDependencies.
	
	self assert: (m headers isEmpty).
	self assert: m numberOfClasses equals: 1
]

{ #category : #'tests - call graph' }
REGModelTest >> testCallGraph [

	| m mainFunction fFunction |
	m := REGModel new.
	m addSrcMLXML: self codeVerySimpleWith3Functions.
	
	self assert: m numberOfFunctions equals: 3.
	self assert: (m allFunctions collect: #name) asArray equals:  #('f' 'g' 'main').
	
	mainFunction := m allFunctions third.
	self assert: mainFunction name equals: 'main'.
	self assert: mainFunction callingFunctionNames asArray equals: #('f' 'g').
	
	fFunction := m allFunctions first.
	self assert: fFunction callingFunctionNames asArray equals: #('printf').
]

{ #category : #'tests - call graph' }
REGModelTest >> testCallGraphIncoming [

	| m mainFunction fFunction gFunction printfFunction |
	m := REGModel new.
	m addSrcMLXML: self codeVerySimpleWith3Functions.
	
	mainFunction := m allFunctions third.
	self assert: mainFunction name equals: 'main'.
	self assert: mainFunction callingFunctionNames asArray equals: #('f' 'g').

	fFunction := m allFunctions first.
	gFunction := m allFunctions second.
	printfFunction := m allFunctions third.
	
	self assert: mainFunction outgoingFunctions isEmpty.
	self assert: fFunction incomingFunctions isEmpty.
	self assert: fFunction incomingFunctions isEmpty.
	
	m buildCallGraph.
	self assert: mainFunction outgoingFunctions notEmpty.
	self assert: mainFunction outgoingFunctions asArray equals: { fFunction . gFunction }.
	self assert: (fFunction incomingFunctions includes: mainFunction)
]

{ #category : #'tests - cpplint' }
REGModelTest >> testCppLint [

	| rules r |
	rules := REGCppLintRules new fromString: self codeCppLint.
	
	self assert: rules size equals: 5.
	
	r := rules first. 
	self assert: r file equals: '/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp'.
	self assert: r lineOfCode equals: 0.
	self assert: r description equals: ' No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]'.
]

{ #category : #tests }
REGModelTest >> testEmpty [

	| m |
	m := REGModel new.
	self assert: m numberOfModules equals: 0.	
	self assert: m numberOfFunctions equals: 0.
]

{ #category : #tests }
REGModelTest >> testImport [

	| m moduleMain header |
	m := REGModel new.
	m addSrcMLXML: self codeExample.

	moduleMain := m modules first.
	self assert: moduleMain filename equals: 'main.c'.
	self assert: (moduleMain numberOfIncludes) equals: 2.
	self assert: (moduleMain includes collect: #name) asArray equals: #('<stdio.h>' '"myOtherModule.h"').
	m buildFileDependencies.
	
	header := m headers first.
	self assert: (moduleMain doesInclude: header)
	
]

{ #category : #tests }
REGModelTest >> testLayers [
	| m l |
	m := REGModel new.
	self assert: m numberOfLayers equals: 0.
	
	l := m getAndCreateIfNecessaryLayerNamed: 'MyLayer'.
	self assert: m numberOfLayers equals: 1.
	self assert: l name equals: 'MyLayer'
]

{ #category : #tests }
REGModelTest >> testLayersNotExisting [
	| m l |
	m := REGModel new.
	m addSrcMLXML: self codeModuleA.
	m buildArchitecture.
	self assert: m numberOfLayers equals: 1.
	
	l := m getAndCreateIfNecessaryLayerNamed: 'a'.
	self assert: m numberOfLayers equals: 1.
	self assert: l name equals: 'a'.
	
	self assert: l outgoingLayers size equals: 0.
	self assert: l modules first outgoingUnits size equals: 0.
]

{ #category : #tests }
REGModelTest >> testVisualizationOnExample [

	| m ss |
	m := REGModel new.
	m addSrcMLXML: self codeExample.
	m buildFileDependencies.
	m buildArchitecture.
	
	ss := m class selectors select: [ :sel | sel beginsWith: 'visualize' ].
	ss do: [ :s | self assert: (m perform: s) notNil ].
	
	m units do: [ :u |
		ss := u class selectors select: [ :sel | sel beginsWith: 'visualize' ].
		ss do: [ :s | self assert: (u perform: s) notNil ].
	].

	m layers do: [ :u |
		ss := u class selectors select: [ :sel | sel beginsWith: 'visualize' ].
		ss do: [ :s | self assert: (u perform: s) notNil ].
	]
]
