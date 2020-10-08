Class {
	#name : #PFMethod,
	#superclass : #PFStructuralElement,
	#instVars : [
		'class',
		'compiledMethod',
		'features'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #accessing }
PFMethod >> addFeature: aPFFeature [
	"&begin[Adding]"
	features add: aPFFeature
	"&end[Adding]"

]

{ #category : #accessing }
PFMethod >> class: aPFClass [
	class := aPFClass
]

{ #category : #accessing }
PFMethod >> compiledMethod [
	^ compiledMethod
]

{ #category : #accessing }
PFMethod >> compiledMethod: aPharoCompiledMethod [
	compiledMethod := aPharoCompiledMethod
]

{ #category : #'public - features' }
PFMethod >> extractFeatureNames [
	"Return the list of extracted feature names"
	| lines beginNames endNames |
	lines := compiledMethod sourceCode lines.
	
	"Just a bit of higyene"
	"&begin[Parsing]"
	beginNames := (lines select: [ :l | '*&begin[*' match: l ]) collect: [ :l | 
							| ss |
							ss := l substrings: '[]'.
							self assert: [ ss size = 3 ].
							ss second ].
	endNames := (lines select: [ :l | '*&begin[*' match: l ]) collect: [ :l | 
							| ss |
							ss := l substrings: '[]'.
							self assert: [ ss size = 3 ].
							ss second ].
	"&end[Parsing]"
	
	"&begin[Assertion]"
	self assert: [ beginNames asSet = endNames asSet ].
	"&end[Assertion]"
	^ beginNames
	
]

{ #category : #accessing }
PFMethod >> features [
	"&begin[Modeling]"
	^ features
	"&end[Modeling]"
]

{ #category : #initialization }
PFMethod >> initialize [
	super initialize.
	features := OrderedCollection new
	
]
