Class {
	#name : #PFModel,
	#superclass : #Object,
	#instVars : [
		'classes',
		'features'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #adding }
PFModel >> addPharoClass: aClass [
	| c |
	"&begin[Modeling]"
	c := PFClass new.
	c pharoClass: aClass.
	c model: self.
	"&end[Modeling]"
	
	"&begin[Adding]"
	classes add: c.
	"&end[Adding]"
	
	"&begin[Processing]"
	self processFeaturesFor: c
	"&end[Processing]"
]

{ #category : #'public - metrics' }
PFModel >> classes [
	^ classes
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

{ #category : #'as yet unclassified' }
PFModel >> featureNames [
	^ features collect: #name
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

{ #category : #initialization }
PFModel >> initialize [
	super initialize.
	classes := OrderedCollection new.
	features := OrderedCollection new
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

{ #category : #adding }
PFModel >> processFeaturesFor: aPFClass [
	| f |
	aPFClass methods do: [ :pfMethod |
		pfMethod extractFeatureNames do: [ :aFeatureName |
			f := self getOrCreateFeatureNamed: aFeatureName.
			self assert: [ f notNil ].
			
			f addMethod: pfMethod.
			pfMethod addFeature: f.
			 ] ] 
]
