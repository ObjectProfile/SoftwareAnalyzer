Class {
	#name : #REGModule,
	#superclass : #REGUnit,
	#instVars : [
		'functions',
		'classes'
	],
	#category : #'SoftwareAnalyzer-CPP'
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

{ #category : #testing }
REGModule >> isModule [
	^ true
]

{ #category : #'public - metrics' }
REGModule >> numberOfClasses [
	^ classes size
]

{ #category : #'public - metrics' }
REGModule >> numberOfFunctions [
	functions ifNil: [ ^ 0 ].
	^ functions size
]
