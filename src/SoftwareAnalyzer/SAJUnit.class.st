Class {
	#name : #SAJUnit,
	#superclass : #SAJStructuralElement,
	#instVars : [
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

{ #category : #accessing }
SAJUnit >> annotations [
	^ annotations
]

{ #category : #accessing }
SAJUnit >> features [
	^ (annotations collect: #feature as: Set) asSortedCollection: [ :f1 :f2 | f1 featureName < f2 featureName ]
]

{ #category : #initialization }
SAJUnit >> initialize [
	super initialize.
	annotations := OrderedCollection new.
	packageName := 'default'
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
SAJUnit >> name: anObject [
	name := anObject
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfAnnotations [
	^ (self features flatCollect: #annotations) size
]

{ #category : #'public - metrics' }
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
	self assert: [ (aString includes: $<) not ].
	packageName := aString
]

{ #category : #printing }
SAJUnit >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self name.
	str nextPut: $>.
]

{ #category : #visualization }
SAJUnit >> visualizeInContainer: compo [
	self features do: [ :feat |
		compo add: (RSBox new model: self; size: 10; model: feat; color: (model scaleForFeaturesColoring scale: feat)).
	].
	RSGridLayout on: compo children.
	

]
