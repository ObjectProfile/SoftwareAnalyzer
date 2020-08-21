Class {
	#name : #SAJUnit,
	#superclass : #SAJObject,
	#instVars : [
		'name',
		'methods',
		'loc'
	],
	#category : #'SoftwareAnalyzer-Java'
}

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

{ #category : #printing }
SAJUnit >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self name.
	str nextPut: $>.
]
