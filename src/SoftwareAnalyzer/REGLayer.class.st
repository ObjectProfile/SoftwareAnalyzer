Class {
	#name : #REGLayer,
	#superclass : #REGObject,
	#instVars : [
		'name',
		'modules'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #adding }
REGLayer >> addModule: aModule [
	modules add: aModule
]

{ #category : #initialization }
REGLayer >> initialize [
	super initialize.
	modules := OrderedCollection new.
]

{ #category : #accessing }
REGLayer >> modules [
	^ modules
]

{ #category : #accessing }
REGLayer >> modules: anObject [
	modules := anObject
]

{ #category : #accessing }
REGLayer >> name [
	^ name
]

{ #category : #accessing }
REGLayer >> name: anObject [
	name := anObject
]

{ #category : #printing }
REGLayer >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	name ifNotNil: [ str nextPutAll: name ].
	str nextPut: $>.
]
