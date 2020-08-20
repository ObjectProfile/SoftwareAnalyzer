Class {
	#name : #REGObject,
	#superclass : #Object,
	#instVars : [
		'metrics'
	],
	#category : #SoftwareAnalyzer
}

{ #category : #accessing }
REGObject >> metrics [
	metrics ifNil: [ metrics := Dictionary new ].
	^ metrics
]

{ #category : #accessing }
REGObject >> numberOfLinesOfCode [
	^ self metrics at: #LOC 
]

{ #category : #accessing }
REGObject >> numberOfLinesOfCode: aNumber [
	self metrics at: #LOC put: aNumber
]
