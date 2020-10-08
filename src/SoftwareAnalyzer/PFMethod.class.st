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
	features add: aPFFeature
]

{ #category : #accessing }
PFMethod >> class: anObject [
	class := anObject
]

{ #category : #accessing }
PFMethod >> compiledMethod [
	^ compiledMethod
]

{ #category : #accessing }
PFMethod >> compiledMethod: anObject [
	compiledMethod := anObject
]

{ #category : #'as yet unclassified' }
PFMethod >> extractFeatureNames [
	| lines beginNames endNames |
	lines := compiledMethod sourceCode lines.
	
	"Just a bit of higyene"
	 
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
						
	self assert: [ beginNames asSet = endNames asSet ].
	^ beginNames
	
]

{ #category : #initialization }
PFMethod >> initialize [
	super initialize.
	features := OrderedCollection new
	
]
