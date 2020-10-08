Class {
	#name : #PFModel,
	#superclass : #Object,
	#instVars : [
		'classes',
		'features',
		'featureColorScale',
		'packages'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #adding }
PFModel >> addPharoClass: aClass [
	| c p |
	"&begin[Modeling]"
	c := PFClass new.
	c pharoClass: aClass.
	c model: self.
	
	p := self getOrCreatePackageNamed: aClass package packageName.
	"&end[Modeling]"
	
	"&begin[Adding]"
	classes add: c.
	p addClass: c.
	c package: p.
	"&end[Adding]"
	
	"&begin[Processing]"
	self processFeaturesFor: c
	"&end[Processing]"
]

{ #category : #'public - metrics' }
PFModel >> classes [
	^ classes
]

{ #category : #visualization }
PFModel >> createColorScaleForFeatures [
	"Return a scale ready to be used to color feature"
	^ NSScale ordinal range: (Color wheel: self numberOfFeatures).
	
]

{ #category : #example }
PFModel >> example [
	"&begin[Example]"
	<script: 'self new example inspect'>
	| pak m |
	pak := RPackageOrganizer default packageNamed: 'GWBasicVisualization'.
	m := PFModel new.
	pak classes do: [ :c |
		m addPharoClass: c ].
	^ m
	"&end[Example]"
]

{ #category : #'public - features' }
PFModel >> featureNamed: aName [
	"&begin[FeatureModeling]"
	^ features detect: [ :f | f name = aName ] ifNone: [ nil ]
	"&end[FeatureModeling]"
]

{ #category : #'public - features' }
PFModel >> featureNames [
	"&begin[Modeling]"
	^ features collect: #name
	"&end[Modeling]"
]

{ #category : #'public - features' }
PFModel >> features [
	"&begin[FeatureModeling]"
	^ features
	"&end[FeatureModeling]"
]

{ #category : #'public - features' }
PFModel >> getOrCreateFeatureNamed: aName [
	"&begin[FeatureModeling]"
	| f |
	f := self featureNamed: aName.
	f ifNotNil: [ ^ f ].
	f := PFFeature new name: aName; yourself.
	"&end[FeatureModeling]"
	"&begin[Adding]"
	features add: f.
	"&end[Adding]"
	^ f
]

{ #category : #'public - features' }
PFModel >> getOrCreatePackageNamed: aName [
	"&begin[FeatureModeling]"
	| p |
	p := self packageNamed: aName.
	p ifNotNil: [ ^ p ].
	p := PFPackage new name: aName; yourself.
	"&end[FeatureModeling]"
	"&begin[Adding]"
	packages add: p.
	"&end[Adding]"
	^ p
]

{ #category : #visualization }
PFModel >> gtInspectorFeatureListIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite table
		title: [ 'Features' translated ];
		display: [ self features ];
		column: 'Name' evaluated: [ :each | each featureName ];
		column: '#Annotations' evaluated: [ :each | each numberOfAnnotations ];
		column: '#Units' evaluated: [ :each | each numberOfUnits ]
]

{ #category : #visualization }
PFModel >> gtInspectorViewAnnotationsIn: composite [
	<gtInspectorPresentationOrder: -50>
	composite roassal3
		title: 'F';
		initializeCanvas: [ self visualizeAnnotations ]
]

{ #category : #initialization }
PFModel >> initialize [
	super initialize.
	classes := OrderedCollection new.
	features := OrderedCollection new.
	packages := OrderedCollection new
]

{ #category : #'public - metrics' }
PFModel >> numberOfClasses [
	"&begin[Metric]"
	^ classes size
	"&end[Metric]"
]

{ #category : #'public - metrics' }
PFModel >> numberOfFeatures [
	"&begin[Metric]"
	^ features size
	"&end[Metric]"
]

{ #category : #'public - features' }
PFModel >> packageNamed: aName [
	"&begin[Modeling]"
	^ packages detect: [ :p | p name = aName ] ifNone: [ nil ]
	"&end[Modeling]"
]

{ #category : #accessing }
PFModel >> packages [
	^ packages
]

{ #category : #adding }
PFModel >> processFeaturesFor: aPFClass [
	| f |
	aPFClass methods do: [ :pfMethod |
		pfMethod extractFeatureNames do: [ :aFeatureName |
			"&begin[Modeling]"
			f := self getOrCreateFeatureNamed: aFeatureName.
			self assert: [ f notNil ].
			
			f addMethod: pfMethod.
			pfMethod addFeature: f.
			"&end[Modeling]"
			 ] ] 
]

{ #category : #visualization }
PFModel >> scaleForFeaturesColoring [
	"Return a scale ready to be used to color feature"
	featureColorScale ifNotNil: [ ^ featureColorScale ].
	featureColorScale := NSScale ordinal range: (Color wheel: self numberOfFeatures).
	^ featureColorScale
]

{ #category : #visualization }
PFModel >> visualizeAnnotations [
	| c pShapes featureShapes |
	c := RSCanvas new.
	
	"We render packages"
	pShapes := packages collect: [ : p |
		p visualizeAnnotationsIn: c
	] as: RSGroup.
	RSGridLayout on: pShapes.
	
	featureShapes := c deepShapesFromModels: self features.
	self assert: [ featureShapes notEmpty ].

	featureShapes do: [ :fs |
		fs @ (RSHighlightable new highlightBorder: (RSBorder new color: Color yellow; width: 5); highlightShapes: [ :ss | featureShapes select: [ :sss | (sss model == fs model) and: [ sss ~~ fs ]  ] ]) ].
	
	pShapes @ RSPopup @ RSDraggable.
	 ^ c @ RSCanvasController
]
