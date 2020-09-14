Class {
	#name : #REGImport,
	#superclass : #REGObject,
	#instVars : [
		'fromUnit',
		'toUnit',
		'name'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #accessing }
REGImport >> basename [
	^ (self rawName substrings: '/') last
]

{ #category : #accessing }
REGImport >> fromUnit [
	^ fromUnit
]

{ #category : #accessing }
REGImport >> fromUnit: anObject [
	fromUnit := anObject
]

{ #category : #accessing }
REGImport >> name [
	^ name
]

{ #category : #accessing }
REGImport >> name: anObject [
	name := anObject
]

{ #category : #accessing }
REGImport >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	self name ifNotNil: [ str nextPutAll: self rawName ].
	str nextPut: $>.
]

{ #category : #accessing }
REGImport >> rawName [
	^ name copyWithoutAll: '<>"'
]

{ #category : #accessing }
REGImport >> toUnit [
	^ toUnit
]

{ #category : #accessing }
REGImport >> toUnit: anObject [
	toUnit := anObject
]
