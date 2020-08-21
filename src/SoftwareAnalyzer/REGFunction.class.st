Class {
	#name : #REGFunction,
	#superclass : #REGObject,
	#instVars : [
		'name',
		'module',
		'incomingFunctions',
		'outgoingFunctions'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #accessing }
REGFunction >> incomingFunctions [
	^ incomingFunctions
]

{ #category : #accessing }
REGFunction >> module [
	^ module
]

{ #category : #accessing }
REGFunction >> module: anObject [
	module := anObject
]

{ #category : #accessing }
REGFunction >> name [
	^ name
]

{ #category : #accessing }
REGFunction >> name: anObject [
	name := anObject
]

{ #category : #accessing }
REGFunction >> outgoingFunctions [
	^ outgoingFunctions
]
