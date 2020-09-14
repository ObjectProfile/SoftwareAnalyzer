Class {
	#name : #REGLayer,
	#superclass : #REGObject,
	#instVars : [
		'name',
		'units'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #adding }
REGLayer >> addUnit: aUnit [
	units add: aUnit
]

{ #category : #visualization }
REGLayer >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'View';
		initializeCanvas: [ self visualize ]
]

{ #category : #accessing }
REGLayer >> headers [
	^ units select: #isHeader
]

{ #category : #initialization }
REGLayer >> initialize [
	super initialize.
	units := OrderedCollection new.
]

{ #category : #accessing }
REGLayer >> modules [
	^ units select: #isModule
]

{ #category : #accessing }
REGLayer >> name [
	^ name
]

{ #category : #accessing }
REGLayer >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
REGLayer >> numberOfOutgoingUnitsToward: aLayer [
	^ (((self modules flatCollect: #outgoingUnits) collect: #layer) select: [ :ll | ll == aLayer ]) size
]

{ #category : #'as yet unclassified' }
REGLayer >> outgoingLayers [
	^ ((self modules flatCollect: #outgoingUnits as: Set) copyWithout: nil) collect: #layer
]

{ #category : #printing }
REGLayer >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	name ifNotNil: [ str nextPutAll: name ].
	str nextPut: $>.
]

{ #category : #'as yet unclassified' }
REGLayer >> units [
	^ units
]

{ #category : #visualization }
REGLayer >> visualize [

	| m |
	m := RSMondrian new.
	m shape circle.
	m nodes: self units.
	m line 
		connectToAll: #outgoingUnits.
	m normalizeColor: #numberOfLinesOfCode.
	m normalizeSize: #numberOfLinesOfCode.
	m layout force charge: -300.
	m translucentShapes.
	m build.
	^ m canvas
]

{ #category : #visualization }
REGLayer >> visualizeOLD [

	| c color uShapes eb |
	c := RSCanvas new.
	
	uShapes := self units collect: [ :u |
		RSBox new "color: (color scale: u numberOfIncludes);" model: u; height: u numberOfLinesOfCode / 5 + 5; width: u numberOfFunctions * 3 + 5.	
	] as: RSGroup.

	c addAll: uShapes.
	
	eb := RSEdgeBuilder arrowedLineWithOffset: 0.2.
	eb canvas: c.
	eb shapes: uShapes.
	eb connectToAll: #outgoingUnits.
	
	
	RSForceBasedLayout on: uShapes.
	^ c @ RSCanvasController
]
