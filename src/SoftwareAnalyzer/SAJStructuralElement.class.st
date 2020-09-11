Class {
	#name : #SAJStructuralElement,
	#superclass : #SAJObject,
	#instVars : [
		'model',
		'name'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #accessing }
SAJStructuralElement >> model [
	^ model
]

{ #category : #accessing }
SAJStructuralElement >> model: aModel [
	model := aModel
]

{ #category : #accessing }
SAJStructuralElement >> name [
	^ name
]

{ #category : #accessing }
SAJStructuralElement >> name: aString [
	self assert: [ aString notNil ].
	self assert: [ aString isByteString ].
	name := aString
]
