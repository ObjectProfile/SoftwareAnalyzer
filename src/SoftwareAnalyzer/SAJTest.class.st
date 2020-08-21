Class {
	#name : #SAJTest,
	#superclass : #TestCase,
	#instVars : [
		'm'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #'as yet unclassified' }
SAJTest >> setUp [
	super setUp.

	m := SAJModel new.
	
]

{ #category : #'as yet unclassified' }
SAJTest >> sourceCodeExampleXML [
^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" revision="1.0.0">

<unit revision="1.0.0" language="Java" filename="Box.java" hash="de9d7b4e3f579771d1e1f1a520198653498e032b"><class><specifier>public</specifier> class <name>Box</name> <super_list><implements>implements <super><name>Shape</name></super></implements></super_list> <block>{ }</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="Canvas.java" hash="61fbdbb8343f88315ea0009e1c246d86d48b4aa9"><import>import <name><name>java</name><operator>.</operator><name>util</name><operator>.</operator><name>*</name></name>;</import>

<class><specifier>public</specifier> class <name>Canvas</name> <block>{
    <decl_stmt><decl><type><specifier>public</specifier> <name><name>List</name><argument_list type="generic">&lt;<argument><name>Shape</name></argument>&gt;</argument_list></name></type> <name>shapes</name> <init>= <expr><operator>new</operator> <call><name><name>ArrayList</name><argument_list type="generic">&lt;&gt;</argument_list></name><argument_list>()</argument_list></call></expr></init></decl>;</decl_stmt>

    <function><type><specifier>public</specifier> <name>void</name></type> <name>add</name><parameter_list>(<parameter><decl><type><name>Shape</name></type> <name>s</name></decl></parameter>)</parameter_list> <block>{<block_content>
	<expr_stmt><expr><call><name><name>shapes</name><operator>.</operator><name>add</name></name><argument_list>(<argument><expr><name>s</name></expr></argument>)</argument_list></call></expr>;</expr_stmt>
    </block_content>}</block></function>

    <function><type><specifier>public</specifier> <name>int</name></type> <name>numberOfShapes</name><parameter_list>()</parameter_list> <block>{<block_content>
	<return>return <expr><call><name><name>shapes</name><operator>.</operator><name>size</name></name><argument_list>()</argument_list></call></expr>;</return>
    </block_content>}</block></function>

    <function><type><specifier>public</specifier> <specifier>static</specifier> <name>void</name></type> <name>main</name><parameter_list>(<parameter><decl><type><name><name>String</name><index>[]</index></name></type> <name>args</name></decl></parameter>)</parameter_list> <block>{<block_content>
	<decl_stmt><decl><type><name>Canvas</name></type> <name>c</name> <init>= <expr><operator>new</operator> <call><name>Canvas</name><argument_list>()</argument_list></call></expr></init></decl>;</decl_stmt>
	<expr_stmt><expr><call><name><name>c</name><operator>.</operator><name>add</name></name><argument_list>(<argument><expr><operator>new</operator> <call><name>Box</name><argument_list>()</argument_list></call></expr></argument>)</argument_list></call></expr>;</expr_stmt>
	<expr_stmt><expr><call><name><name>c</name><operator>.</operator><name>add</name></name><argument_list>(<argument><expr><operator>new</operator> <call><name>Circle</name><argument_list>()</argument_list></call></expr></argument>)</argument_list></call></expr>;</expr_stmt>
	<expr_stmt><expr><call><name><name>System</name><operator>.</operator><name>out</name><operator>.</operator><name>println</name></name><argument_list>(<argument><expr><literal type="string">"Number of added shapes = "</literal> <operator>+</operator> <call><name><name>c</name><operator>.</operator><name>numberOfShapes</name></name><argument_list>()</argument_list></call></expr></argument>)</argument_list></call></expr>;</expr_stmt>
    </block_content>}</block></function>
	
}</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="Circle.java" hash="91c9425a39b2b0ca0dbda34b8dfa457d020cf3b4"><class><specifier>public</specifier> class <name>Circle</name> <super_list><implements>implements <super><name>Shape</name></super></implements></super_list> <block>{
}</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="ColoredCircle.java" hash="af09de788ea65cb5dbca223746caefb62fa6f882"><class><specifier>public</specifier> class <name>ColoredCircle</name> <super_list><extends>extends <super><name>Circle</name></super></extends></super_list> <block>{
}</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="Shape.java" hash="164b8db223193c1787e34763f3e20befb6ea8716"><interface><specifier>public</specifier> interface <name>Shape</name> <block>{
}</block></interface>
</unit>

</unit>
'
]

{ #category : #'as yet unclassified' }
SAJTest >> testBasic [

	m addSrcMLXML: self sourceCodeExampleXML.
	self assert: m numberOfClasses equals: 4.
	self assert: m numberOfInterfaces equals: 1.

	self assert: ((m classes collect: #name) includesAll:
			 #( 'Box' 'Circle' 'Canvas' 'ColoredCircle' )).

	self assert: ((m interfaces collect: #name) includesAll:
			 #( 'Shape' )).
]

{ #category : #'as yet unclassified' }
SAJTest >> testEmpty [
	self assert: m numberOfClasses equals: 0
]

{ #category : #'as yet unclassified' }
SAJTest >> testInterfacesNamed [

	| cls |
	m addSrcMLXML: self sourceCodeExampleXML.
	
	cls := m interfaceNamed: 'Shape'.
	self assert: cls notNil.
	self should: [ m interfaceNamed: 'NotExisting' ] raise: Error
]

{ #category : #'as yet unclassified' }
SAJTest >> testSuperclasses [

	| cls |
	m addSrcMLXML: self sourceCodeExampleXML.
	
	cls := m classNamed: 'ColoredCircle'.
	self assert: cls superclassName equals: 'Circle'.
	self assert: cls superclass isNil.
	
	m resolveBindings.
	
	self assert: cls superclass equals: (m classNamed: 'Circle').
	self assert: cls hasSuperclass.
	self assert: (m classNamed: 'Circle') superclass isNil.
	
	self assert: (m classNamed: 'Canvas') superclass isNil.
	self deny: (m classNamed: 'Canvas') hasSuperclass.
	
	
	self should: [ m classNamed: 'NotExisting' ] raise: Error
]
