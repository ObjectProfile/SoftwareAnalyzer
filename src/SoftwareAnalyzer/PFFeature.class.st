Class {
	#name : #PFFeature,
	#superclass : #PFStructuralElement,
	#instVars : [
		'methods',
		'color'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #initialization }
PFFeature >> addMethod: aPFMethod [
	self assert: [ aPFMethod class == PFMethod ].
	methods add: aPFMethod
]

{ #category : #accessing }
PFFeature >> color [
	^ color
]

{ #category : #accessing }
PFFeature >> color: anObject [
	color := anObject
]

{ #category : #initialization }
PFFeature >> initialize [
	super initialize.
	methods := OrderedCollection new.
]
