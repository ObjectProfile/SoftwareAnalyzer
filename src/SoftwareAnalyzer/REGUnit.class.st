Class {
	#name : #REGUnit,
	#superclass : #REGObject,
	#instVars : [
		'includes',
		'filename'
	],
	#category : #SoftwareAnalyzer
}

{ #category : #adding }
REGUnit >> addInclude: anInclude [
	includes add: anInclude
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
REGUnit >> filename: anObject [
	filename := anObject
]

{ #category : #accessing }
REGUnit >> includes [
	^ includes
]

{ #category : #accessing }
REGUnit >> includes: anObject [
	includes := anObject
]

{ #category : #initialization }
REGUnit >> initialize [
	super initialize.
	includes := OrderedCollection new
]

{ #category : #'as yet unclassified' }
REGUnit >> numberOfIncludes [
	^ includes size
]

{ #category : #'as yet unclassified' }
REGUnit >> outgoingUnits [
	^ self includes collect: #toUnit
]
