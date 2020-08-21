Class {
	#name : #SAJModel,
	#superclass : #Object,
	#instVars : [
		'units'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJModel >> addClassAsXML: xml [
	| classname aClass hasSuperclass superclassName |
	classname := ((xml elementAt: 'class') elementAt: 'name') nodes first asString.

	
"	hasSuperclass := ((((xml elementAt: 'class') elementAt: 'super_list') elementAt: 'extends') 
								elementAt: 'super') nodes first nodes first asString.
"	
	hasSuperclass := xml @ { 'class' . 'super_list' . 'extends' . 'super' }.

	hasSuperclass notNil ifTrue: [ 
		superclassName := ((((xml elementAt: 'class') elementAt: 'super_list') elementAt: 'extends') 
									elementAt: 'super') nodes first nodes first asString ].
	
	
	aClass := SAJClass new
					name: classname;
					superclassName: superclassName.
	units add: aClass
]

{ #category : #adding }
SAJModel >> addInterfaceAsXML: xml [
	| interfaceName aClass |
	interfaceName := ((xml elementAt: 'interface') elementAt: 'name') nodes first asString.
	aClass := SAJInterface new
					name: interfaceName.
	units add: aClass
]

{ #category : #adding }
SAJModel >> addSrcMLXML: xml [
	"xml as string
	
	Using:
	srcml *.java -o example.xml
	"
	| someClasses |
	someClasses := (XMLDOMParser parse: xml) document
		descendantNodesSelect: [ :x | (x class ~~ XMLString) and: [ x name = 'unit' and: [ x attributes includesKey: 'filename' ] ] ].
		
	someClasses do: [ :u | self addUnitAsXML: u ]
]

{ #category : #adding }
SAJModel >> addUnitAsXML: xml [
	(xml elementAt: 'class') ifNotNil: [ ^ self addClassAsXML: xml ].
	(xml elementAt: 'interface') ifNotNil: [ ^ self addInterfaceAsXML: xml ].
]

{ #category : #accessing }
SAJModel >> classNamed: aClassName [
	^ self classes detect: [ :cls | cls name = aClassName ]
]

{ #category : #accessing }
SAJModel >> classNamed: aClassName ifNone: block [
	^ self classes detect: [ :cls | cls name = aClassName ] ifNone: block
]

{ #category : #'public - metrics' }
SAJModel >> classes [

	^ units select: #isClass
]

{ #category : #initialization }
SAJModel >> initialize [
	super initialize.
	units := OrderedCollection new
]

{ #category : #accessing }
SAJModel >> interfaceNamed: aClassName [
	^ self interfaces detect: [ :cls | cls name = aClassName ]
]

{ #category : #'public - metrics' }
SAJModel >> interfaces [

	^ units select: #isInterface
]

{ #category : #'public - metrics' }
SAJModel >> numberOfClasses [

	^ self classes size
]

{ #category : #'public - metrics' }
SAJModel >> numberOfInterfaces [

	^ self interfaces size
]

{ #category : #'as yet unclassified' }
SAJModel >> resolveBindings [
	self classes do: [ :cls |
		cls superclassName ifNotNil: [ 
			cls superclass: (self classNamed: cls superclassName ifNone: [ nil ]) ]  ]
]
