Class {
	#name : #REGModule,
	#superclass : #REGUnit,
	#instVars : [
		'functions',
		'classes'
	],
	#category : #SoftwareAnalyzer
}

{ #category : #adding }
REGModule >> addClass: aClass [
	classes add: aClass
]

{ #category : #adding }
REGModule >> addFunction: aFunction [
	self assert: [ aFunction class == REGFunction ].
	functions add: aFunction.
	aFunction module: self
]

{ #category : #accessing }
REGModule >> functions [
	functions ifNil: [ ^ #() ].
	^ functions
]

{ #category : #initialization }
REGModule >> initialize [
	super initialize.
	functions := OrderedCollection new.
	classes := OrderedCollection new
]

{ #category : #'public - metrics' }
REGModule >> numberOfClasses [
	^ classes size
]

{ #category : #'as yet unclassified' }
REGModule >> numberOfFunctions [
	functions ifNil: [ ^ 0 ].
	^ functions size
]
