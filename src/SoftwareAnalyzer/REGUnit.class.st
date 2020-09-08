Class {
	#name : #REGUnit,
	#superclass : #REGObject,
	#instVars : [
		'includes',
		'filename',
		'layer'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #adding }
REGUnit >> addInclude: anInclude [
	includes add: anInclude
]

{ #category : #accessing }
REGUnit >> basename [
	^ (filename substrings: '/') last
]

{ #category : #'public - testing' }
REGUnit >> doesInclude: aUnit [

	^ includes anySatisfy: [ :i | i toUnit == aUnit ]
]

{ #category : #accessing }
REGUnit >> filename [
	^ filename
]

{ #category : #accessing }
REGUnit >> filename: aString [
	self assert: [ aString isByteString ] description: 'Wrong type'.
	filename := aString
]

{ #category : #accessing }
REGUnit >> includes [
	^ includes
]

{ #category : #accessing }
REGUnit >> includes: anObject [
	includes := anObject
]

{ #category : #'as yet unclassified' }
REGUnit >> incomingUnits [
	^ self includes collect: #fromUnit
]

{ #category : #initialization }
REGUnit >> initialize [
	super initialize.
	includes := OrderedCollection new
]

{ #category : #testing }
REGUnit >> isHeader [
	^ false
]

{ #category : #testing }
REGUnit >> isModule [
	^ false
]

{ #category : #accessing }
REGUnit >> layer [
	^ layer
]

{ #category : #accessing }
REGUnit >> layer: aLayer [
	layer := aLayer
	
]

{ #category : #'as yet unclassified' }
REGUnit >> numberOfIncludes [
	^ includes size
]

{ #category : #'as yet unclassified' }
REGUnit >> outgoingUnits [
	^ (self includes collect: #toUnit)
]

{ #category : #'as yet unclassified' }
REGUnit >> outgoingUnitsToward: unit [
	^ self includes collect: [ :u | u toUnit == unit ]
]

{ #category : #accessing }
REGUnit >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self basename.
	str nextPut: $>.
]
