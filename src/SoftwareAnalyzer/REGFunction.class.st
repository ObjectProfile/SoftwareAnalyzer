Class {
	#name : #REGFunction,
	#superclass : #REGObject,
	#instVars : [
		'name',
		'module',
		'callingFunctionNames',
		'incomingFunctions',
		'outgoingFunctions'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #accessing }
REGFunction >> addIncomingFunction: aFunction [
	self assert: [ aFunction class == REGFunction ].
	incomingFunctions add: aFunction
	
]

{ #category : #accessing }
REGFunction >> addOutgoingFunctions: someFunctions [
	self assert: [ someFunctions isCollection ].
	self assert: [ someFunctions allSatisfy: [ :f | f class == REGFunction ] ].
	outgoingFunctions addAll: someFunctions
]

{ #category : #accessing }
REGFunction >> callingFunctionNames [
	"Return the list of name of functions called by me"
	^ callingFunctionNames
]

{ #category : #accessing }
REGFunction >> callingFunctionNames: someNames [
	"Set the list of name of functions called by me"
	self assert: [ someNames isCollection ].
	self assert: [ someNames allSatisfy: [ :n | n isString ] ].
	callingFunctionNames := someNames
]

{ #category : #accessing }
REGFunction >> incomingFunctions [
	^ incomingFunctions
]

{ #category : #initialization }
REGFunction >> initialize [
	super initialize.
	callingFunctionNames := OrderedCollection new.
	outgoingFunctions := OrderedCollection new.
	incomingFunctions := OrderedCollection new.
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
