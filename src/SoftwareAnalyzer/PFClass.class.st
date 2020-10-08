Class {
	#name : #PFClass,
	#superclass : #PFStructuralElement,
	#instVars : [
		'pharoClass',
		'methodsCache',
		'package'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #'as yet unclassified' }
PFClass >> extractFeatureNames [
	^ self methods flatCollect: #extractFeatureNames
]

{ #category : #accessing }
PFClass >> features [
	| result |
	result := OrderedCollection new.
	pharoClass compiledMethods do: [ :cm |
	].
	^ result
]

{ #category : #accessing }
PFClass >> methods [
	methodsCache ifNotNil: [ ^ methodsCache ].
	methodsCache := pharoClass methods collect: [ :cm |
				PFMethod new class: self; compiledMethod: cm ].
	^ methodsCache
]

{ #category : #accessing }
PFClass >> package [
	^ package
]

{ #category : #accessing }
PFClass >> package: aPFPackage [
	package := aPFPackage
]

{ #category : #accessing }
PFClass >> pharoClass [
	^ pharoClass
]

{ #category : #accessing }
PFClass >> pharoClass: aPharoClass [
	self assert: [ aPharoClass isBehavior ].
	pharoClass := aPharoClass
]
