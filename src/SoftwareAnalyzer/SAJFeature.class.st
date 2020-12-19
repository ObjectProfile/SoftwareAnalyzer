Class {
	#name : #SAJFeature,
	#superclass : #SAJStructuralElement,
	#instVars : [
		'annotations',
		'color',
		'parent',
		'children'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #initialization }
SAJFeature >> addAnnotation: aFeatureAnnotation [
	annotations add: aFeatureAnnotation
]

{ #category : #accessing }
SAJFeature >> addChild: aFeature [
	children add: aFeature
]

{ #category : #accessing }
SAJFeature >> annotations [
	^ annotations
]

{ #category : #'as yet unclassified' }
SAJFeature >> anotationsForUnit: aUnit [
	^ self annotations select: [ :a | a unit == aUnit ]
]

{ #category : #visualization }
SAJFeature >> classes [
	^ self units select: #isClass
]

{ #category : #accessing }
SAJFeature >> color [
	^ color
]

{ #category : #accessing }
SAJFeature >> color: aColor [
	color := aColor
]

{ #category : #accessing }
SAJFeature >> featureName [
	^ name
]

{ #category : #accessing }
SAJFeature >> featureName: anObject [
	name := anObject
]

{ #category : #visualization }
SAJFeature >> gtInspectorView2In: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Classes';
		initializeCanvas: [ self visualize ]
]

{ #category : #initialization }
SAJFeature >> initialize [
	super initialize.
	annotations := OrderedCollection new.
	children := OrderedCollection new
]

{ #category : #'as yet unclassified' }
SAJFeature >> interactingFeatures [
	^ (self units flatCollect: #features) asSet
]

{ #category : #'as yet unclassified' }
SAJFeature >> numberOfAnnotations [
	^ annotations size
]

{ #category : #'as yet unclassified' }
SAJFeature >> numberOfUnits [

	^ self units asSet size
]

{ #category : #accessing }
SAJFeature >> parent [
	^ parent
]

{ #category : #accessing }
SAJFeature >> parent: aParentFeature [
	parent := aParentFeature
]

{ #category : #printing }
SAJFeature >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self featureName.
	str nextPut: $>.
]

{ #category : #'as yet unclassified' }
SAJFeature >> units [

	^ (annotations collect: #unit) select: #notNil
]

{ #category : #visualization }
SAJFeature >> visualize [
	| c |
	c := RSCanvas new.
	SAJPackage new model: self model; visualizeClasses: self classes asSet inContainer: c.
	
	RSRectanglePackLayout new on: c shapes.
	^ c @ RSCanvasController
]

{ #category : #visualization }
SAJFeature >> visualizeOLD [
	| c shapes eb |
	c := RSCanvas new.
	shapes := self classes asSet collect: [ :u | RSBox new model: u ] as: RSGroup.
	c addAll: shapes.
	shapes @ RSDraggable @ RSPopup @ RSLabeled.

	eb := RSEdgeBuilder orthoVertical.
	eb canvas: c.
	eb shapes: shapes.
	eb connectFrom: #superclass.
	
	RSNormalizer size
		shapes: shapes;
		normalize: #loc.

	RSRectanglePackLayout new on: shapes.
	^ c @ RSCanvasController
]
