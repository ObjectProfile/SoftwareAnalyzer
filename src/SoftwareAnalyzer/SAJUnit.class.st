Class {
	#name : #SAJUnit,
	#superclass : #SAJObject,
	#instVars : [
		'name',
		'methods',
		'loc',
		'annotations',
		'package',
		'packageName'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJUnit >> addAnnotation: ann [
	annotations add: ann
]

{ #category : #'as yet unclassified' }
SAJUnit >> annotations [
	^ annotations
]

{ #category : #'as yet unclassified' }
SAJUnit >> features [
	^ (annotations collect: #feature as: Set) asSortedCollection: [ :f1 :f2 | f1 featureName < f2 featureName ]
]

{ #category : #initialization }
SAJUnit >> initialize [
	super initialize.
	annotations := OrderedCollection new
]

{ #category : #testing }
SAJUnit >> isClass [
	^ false
]

{ #category : #testing }
SAJUnit >> isInterface [
	^ false
]

{ #category : #accessing }
SAJUnit >> loc [
	^ loc
]

{ #category : #accessing }
SAJUnit >> loc: anObject [
	loc := anObject
]

{ #category : #accessing }
SAJUnit >> methods [
	^ methods
]

{ #category : #accessing }
SAJUnit >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
SAJUnit >> name [
	^ name
]

{ #category : #accessing }
SAJUnit >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
SAJUnit >> numberOfAnnotations [
	^ (self features flatCollect: #annotations) size
]

{ #category : #'as yet unclassified' }
SAJUnit >> numberOfFeatures [
	^ self features size
]

{ #category : #accessing }
SAJUnit >> package [
	^ package
]

{ #category : #accessing }
SAJUnit >> package: aPackage [
	package := aPackage
]

{ #category : #accessing }
SAJUnit >> packageName [
	^ packageName
]

{ #category : #accessing }
SAJUnit >> packageName: aString [
	self assert: [ aString isByteString ].
	packageName := aString
]

{ #category : #printing }
SAJUnit >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self name.
	str nextPut: $>.
]
