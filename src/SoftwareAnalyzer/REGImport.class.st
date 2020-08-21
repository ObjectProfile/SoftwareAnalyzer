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

{ #category : #'as yet unclassified' }
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
