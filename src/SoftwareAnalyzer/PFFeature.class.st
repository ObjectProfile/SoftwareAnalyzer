Class {
	#name : #PFFeature,
	#superclass : #PFStructuralElement,
	#instVars : [
		'methods'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #initialization }
PFFeature >> addMethod: aPFMethod [
	self assert: [ aPFMethod class == PFMethod ].
	methods add: aPFMethod
]

{ #category : #initialization }
PFFeature >> initialize [
	super initialize.
	methods := OrderedCollection new.
]
