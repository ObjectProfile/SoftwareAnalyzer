Class {
	#name : #SAJColoredFeatureTreePalette,
	#superclass : #RSObject,
	#instVars : [
		'totalNumberOfLeaves',
		'features'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #private }
SAJColoredFeatureTreePalette >> allLeavesAccessibleFrom: aRootFeature [ 

	| c |
	c := OrderedCollection new.
	self allLeavesAccessibleFrom: aRootFeature in: c.
	^ c size
]

{ #category : #private }
SAJColoredFeatureTreePalette >> allLeavesAccessibleFrom: aFeature in: result [

	aFeature children isEmpty
		ifTrue: [
			result add: self ]
		ifFalse: [ 
			 aFeature children do: [ :f | self allLeavesAccessibleFrom: f in: result ]
			 ]

]

{ #category : #public }
SAJColoredFeatureTreePalette >> assignColor [

	| roots |
	roots := features select: [ :s | s parent isNil ].
	roots do: [ :r | self assignColorToRoot: r ]
]

{ #category : #private }
SAJColoredFeatureTreePalette >> assignColorToChildren: children low: low high: high [
	| step hs |
	step := high - low / children size.
	hs := low to: high count: children size.
	
"self halt."
	children with: hs do: [ :s :h |
		self assignColorToRoot: s h: (h min: 360 max: 0)
	]
	
]

{ #category : #private }
SAJColoredFeatureTreePalette >> assignColorToRoot: aRootFeature [
	self assignColorToRoot: aRootFeature h: 360 / 2
]

{ #category : #private }
SAJColoredFeatureTreePalette >> assignColorToRoot: aRootFeature h: h [
	| children span |
	
	aRootFeature color: (Color h: h s: 1 v: 1).

	children := aRootFeature children.
	children ifEmpty: [ ^ self ].
	span := (self allLeavesAccessibleFrom: aRootFeature) * 360 / (totalNumberOfLeaves ).
	self assignColorToChildren: children low: h - (span / 2) high: h + (span / 2).
]

{ #category : #accessing }
SAJColoredFeatureTreePalette >> features [

	^ features
]

{ #category : #accessing }
SAJColoredFeatureTreePalette >> features: someFeatures [
	"Set the features that must be colored as root"
	features := someFeatures.
	totalNumberOfLeaves := 0.
	(someFeatures select: [ :s | s parent isNil ]) do: [ :s | 
		totalNumberOfLeaves := totalNumberOfLeaves + (self allLeavesAccessibleFrom: s)
	]
]

{ #category : #accessing }
SAJColoredFeatureTreePalette >> totalNumberOfLeaves [
	"Return the total number of leaves"
	^ totalNumberOfLeaves
]
