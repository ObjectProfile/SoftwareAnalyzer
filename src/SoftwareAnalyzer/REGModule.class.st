Class {
	#name : #REGModule,
	#superclass : #REGUnit,
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #'as yet unclassified' }
REGModule >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -15>
	composite roassal3
		title: 'Callgraph';
		initializeCanvas: [ self visualizeCallGraph ]
]

{ #category : #initialization }
REGModule >> initialize [
	super initialize.
	functions := OrderedCollection new.
	classes := OrderedCollection new
]

{ #category : #testing }
REGModule >> isModule [
	^ true
]

{ #category : #'as yet unclassified' }
REGModule >> visualizeCallGraph [
	| m |
	m := RSMondrian new.
	m nodes: self functions.
	m normalizeSize: #numberOfLinesOfCode.
	m line connectToAll: #outgoingFunctions.
	m build.
	^ m canvas
]
