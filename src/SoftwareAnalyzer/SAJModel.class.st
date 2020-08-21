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
	| classname aClass |
	classname := ((xml elementAt: 'class') elementAt: 'name') nodes first asString.
	aClass := SAJClass new
					name: classname.
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

{ #category : #initialization }
SAJModel >> initialize [
	super initialize.
	units := OrderedCollection new
]

{ #category : #'public - metrics' }
SAJModel >> numberOfClasses [
	^ (units select: #isClass) size
]

{ #category : #'public - metrics' }
SAJModel >> numberOfInterfaces [
	^ (units select: #isInterface) size
]
