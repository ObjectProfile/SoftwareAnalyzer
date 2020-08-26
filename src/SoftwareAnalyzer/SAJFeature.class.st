Class {
	#name : #SAJFeature,
	#superclass : #SAJObject,
	#instVars : [
		'featureName',
		'annotations'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #initialization }
SAJFeature >> addAnnotation: aFeatureAnnotation [
	annotations add: aFeatureAnnotation
]

{ #category : #accessing }
SAJFeature >> annotations [
	^ annotations
]

{ #category : #visualization }
SAJFeature >> classes [
	^ self units select: #isClass
]

{ #category : #accessing }
SAJFeature >> featureName [
	^ featureName
]

{ #category : #accessing }
SAJFeature >> featureName: anObject [
	featureName := anObject
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
	annotations := OrderedCollection new
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
