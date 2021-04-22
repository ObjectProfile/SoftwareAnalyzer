Class {
	#name : #SAJFeature,
	#superclass : #SAJStructuralElement,
	#instVars : [
		'annotations',
		'color',
		'parent',
		'children',
		'isSelected'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #public }
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

{ #category : #accessing }
SAJFeature >> anotationsForUnit: aUnit [
	^ self annotations select: [ :a | a unit == aUnit ]
]

{ #category : #accessing }
SAJFeature >> children [
	^ children asArray
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
SAJFeature >> featureName: aNameAsString [
	name := aNameAsString
]

{ #category : #initialization }
SAJFeature >> initialize [
	super initialize.
	annotations := OrderedCollection new.
	children := OrderedCollection new.
	isSelected := false.
]

{ #category : #visualization }
SAJFeature >> inspectorCanvas2 [
	<inspectorPresentationOrder: 90 title: 'Contribution'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeContribution;
		yourself

]

{ #category : #visualization }
SAJFeature >> inspectorCanvas2Context: aContext [
  
  aContext withoutEvaluator
	

]

{ #category : #visualization }
SAJFeature >> inspectorClasses [
	<inspectorPresentationOrder: 90 title: 'Classes'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeClasses;
		yourself

]

{ #category : #visualization }
SAJFeature >> inspectorClassesContext: aContext [
  
  aContext withoutEvaluator
	

]

{ #category : #accessing }
SAJFeature >> interactingFeatures [
	^ (self units flatCollect: #features) asSet
]

{ #category : #accessing }
SAJFeature >> isSelected [
	"Return true if the feature is selected"
	^ isSelected
]

{ #category : #public }
SAJFeature >> makeAsSelected [
	isSelected := true
]

{ #category : #public }
SAJFeature >> makeAsUnselected [
	isSelected := false
]

{ #category : #accessing }
SAJFeature >> numberOfAnnotations [
	^ annotations size
]

{ #category : #accessing }
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

{ #category : #accessing }
SAJFeature >> units [

	^ (annotations collect: #unit as: Set) select: #notNil
]

{ #category : #visualization }
SAJFeature >> visualizeClasses [
	| c g lbl |
	c := RSCanvas new.
	
	self classes do: [ :cls |
		g := RSGroup new.
		cls visualizeIn: g.
		c add: g asShape.
		 ].
	
	RSRectanglePackLayout new on: c shapes.
	
	lbl := RSLabel new fontSize: 20; text: 'Classes contributed by feature ', self name.
	c add: lbl.
	RSLocation move: lbl above: c nodes.
	
	^ c @ RSCanvasController
]

{ #category : #visualization }
SAJFeature >> visualizeContribution [
	| c |
	c := RSCanvas new.
	
	self classes asSet isEmpty 
		ifTrue: [ c add: (RSLabel text: 'This feature does not contribute to classes') ]
		ifFalse: [ 
			SAJPackage new model: self model; visualizeClasses: self classes asSet inContainer: c.
			RSRectanglePackLayout new on: c shapes ].
	
	
	^ c @ RSCanvasController
]
