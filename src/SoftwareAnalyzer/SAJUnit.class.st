Class {
	#name : #SAJUnit,
	#superclass : #SAJStructuralElement,
	#instVars : [
		'methods',
		'loc',
		'annotations',
		'package',
		'packageName',
		'filename'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJUnit >> addAnnotation: ann [
	annotations add: ann
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

{ #category : #initialization }
SAJUnit >> initialize [
	super initialize.
	annotations := OrderedCollection new.
	packageName := 'default'
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
	| c b ab |
	c := RSCanvas new.
	
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
	
	^ c @ RSCanvasController
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
