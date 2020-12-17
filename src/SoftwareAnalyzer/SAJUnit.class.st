Class {
	#name : #SAJUnit,
	#superclass : #SAJStructuralElement,
	#instVars : [
		'methods',
		'loc',
		'annotations',
		'package',
		'packageName',
		'filename',
		'imports',
		'outgoingUnits',
		'incomingUnits'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJUnit >> addAnnotation: ann [
	annotations add: ann
]

{ #category : #adding }
SAJUnit >> addImport: anImport [
	imports add: anImport 
]

{ #category : #adding }
SAJUnit >> addIncomingUnit: aUnit [
	incomingUnits add: aUnit
]

{ #category : #adding }
SAJUnit >> addOutgoingUnit: aUnit [
	outgoingUnits add: aUnit
]

{ #category : #accessing }
SAJUnit >> annotations [
	^ annotations
]

{ #category : #'as yet unclassified' }
SAJUnit >> buildAnnotationHierarchy [
	"Build the hierarchy of the annotation. Compute the parent annotation for each parent.
	This method assumes that each annotation has one parent at most."
	| sortedAnnotations parentsStack runningParent |
	self assert: [ self annotations allSatisfy: [ :a | a parentAnnotation isNil ] ].
	sortedAnnotations := self annotations sortedAs: #from.
	
	parentsStack := OrderedCollection new.

	sortedAnnotations do: [ :a |
		parentsStack 
			ifEmpty: [ parentsStack add: a ]
			ifNotEmpty: [
		
				runningParent := parentsStack last.
				(runningParent from < a from and: [ runningParent to > a to ])
					ifTrue: [ a parentAnnotation: runningParent. parentsStack add: a ].
				(runningParent from < a to) ifTrue: [ parentsStack removeLast ].
			]
	]

]

{ #category : #accessing }
SAJUnit >> features [
	^ (annotations collect: #feature as: Set) asSortedCollection: [ :f1 :f2 | f1 featureName < f2 featureName ]
]

{ #category : #accessing }
SAJUnit >> filename [
	^ filename
]

{ #category : #accessing }
SAJUnit >> filename: anObject [
	filename := anObject
]

{ #category : #'as yet unclassified' }
SAJUnit >> gtInspectorSourceCodeIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'Source';
		display: #sourceCode
]

{ #category : #'as yet unclassified' }
SAJUnit >> gtInspectorVisualizeIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Visualize';
		initializeCanvas: [ self visualize ]
]

{ #category : #accessing }
SAJUnit >> imports [
	^ imports
]

{ #category : #accessing }
SAJUnit >> incomingUnits [
	^ incomingUnits
]

{ #category : #initialization }
SAJUnit >> initialize [
	super initialize.
	annotations := OrderedCollection new.
	packageName := 'default'.
	imports := OrderedCollection new.
	outgoingUnits := OrderedCollection new.
	incomingUnits := OrderedCollection new
]

{ #category : #testing }
SAJUnit >> isClass [
	^ false
]

{ #category : #testing }
SAJUnit >> isEnum [
	^ false
]

{ #category : #testing }
SAJUnit >> isInterface [
	^ false
]

{ #category : #accessing }
SAJUnit >> loc [
	^ loc
]

{ #category : #accessing }
SAJUnit >> loc: anObject [
	loc := anObject
]

{ #category : #accessing }
SAJUnit >> methods [
	^ methods
]

{ #category : #accessing }
SAJUnit >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
SAJUnit >> name: anObject [
	name := anObject
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfAnnotations [
	^ (self features flatCollect: #annotations) size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfFeatures [
	^ self features size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfImports [
	^ imports size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfIncomingUnits [
	^ incomingUnits size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfOutgoingUnits [
	^ outgoingUnits size
]

{ #category : #accessing }
SAJUnit >> outgoingUnits [
	^ outgoingUnits
]

{ #category : #accessing }
SAJUnit >> package [
	^ package
]

{ #category : #accessing }
SAJUnit >> package: aPackage [
	package := aPackage
]

{ #category : #accessing }
SAJUnit >> packageName [
	^ packageName
]

{ #category : #accessing }
SAJUnit >> packageName: aString [
	self assert: [ aString isByteString ].
	self assert: [ (aString includes: $<) not ].
	packageName := aString
]

{ #category : #printing }
SAJUnit >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self name.
	str nextPutAll: ', Fan-out: '.
	str nextPutAll: self numberOfOutgoingUnits asString.
	str nextPutAll: ', Fan-in: '.
	str nextPutAll: self numberOfIncomingUnits asString.
	str nextPut: $>.
]

{ #category : #accessing }
SAJUnit >> sourceCode [
	| fr |
	(self model isNil |
	 self model rootFilename isNil |
	 self model rootFilename isEmpty) ifTrue: [ ^ '' ].
	fr := (self model rootFilename, '/', self filename) asFileReference.
	fr exists ifFalse: [ ^ '' ].
	^ fr contents
]

{ #category : #visualization }
SAJUnit >> visualize [
	| c in g out all lblOut lblIn |
	c := RSCanvas new.
	
	in := RSGroup new.
	self incomingUnits do: [ :u |
		g := RSGroup new.
		u visualizeIn: g.
		in add: g asShape.
	].
	out := RSGroup new.
	self outgoingUnits do: [ :u |
		g := RSGroup new.
		u visualizeIn: g.
		out add: g asShape.
	].

	c addAll: in; addAll: out.
	
	g := RSGroup new.
	self visualizeIn: g.
	c add: g asShape.

	RSGridLayout on: in.
	RSGridLayout on: out.
	
	all := RSGroup new.
	all add: in.
	all add: g.
	all add: out.
	RSHorizontalLineLayout new alignMiddle; gapSize: 300; on: all.

	g translateBy: g extent / -2.
	
	lblOut := RSLabel new fontSize: 50; text: 'Outgoing units ', (out size asString), ')'. 
	c add: lblOut.
	RSLocation move: lblOut above: out. 

	lblIn := RSLabel new fontSize: 50; text: 'Incoming units (', (in size asString), ')'.
	c add: lblIn.
	RSLocation move: lblIn above: in. 


	^ c @ RSCanvasController

"	| c g |
	c := RSCanvas new.
	g := RSGroup new.
	self visualizeIn: g.
	c add: g asShape.
	^ c @ RSCanvasController"
]

{ #category : #visualization }
SAJUnit >> visualizeIn: c [
	| b ab |
	
	b := RSBox model: self.
	b @ RSPopup.
	b fromRectangle: ((-25 @ 0) corner: (25 @ self loc)).
	b width: 50.
	c add: b.
	
	self annotations do: [ :a |
		ab := RSBox model: a.
		ab @ RSPopup.
		ab color: a feature color.
		ab fromRectangle: ((-25 @ a from) corner: (25 @ (a to + 1))).
		ab translateBy: (a depth * 20) @ 0.
		c add: ab.
	].

]

{ #category : #visualization }
SAJUnit >> visualizeInContainer: compo [
	self features do: [ :feat |
		| aSize |
		aSize := ((feat anotationsForUnit: self) collect: #numberOfLinesOfCode) sum sqrt * 4.
		compo add: (RSBox new model: self; size: aSize; model: feat; color: (feat color)).
	].
	compo children @ RSPopup.
	RSGridLayout on: compo children.
	

]
