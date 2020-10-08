Class {
	#name : #PFStructuralElement,
	#superclass : #Object,
	#instVars : [
		'name',
		'model'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #accessing }
PFStructuralElement >> model [
	^ model
]

{ #category : #accessing }
PFStructuralElement >> model: anObject [
	model := anObject
]

{ #category : #accessing }
PFStructuralElement >> name [
	^ name
]

{ #category : #accessing }
PFStructuralElement >> name: aString [
	name := aString
]
