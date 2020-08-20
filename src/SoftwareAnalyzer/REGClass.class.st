Class {
	#name : #REGClass,
	#superclass : #REGObject,
	#instVars : [
		'name',
		'superclass',
		'functions'
	],
	#category : #SoftwareAnalyzer
}

{ #category : #accessing }
REGClass >> functions [
	^ functions
]

{ #category : #accessing }
REGClass >> functions: anObject [
	functions := anObject
]

{ #category : #accessing }
REGClass >> name [
	^ name
]

{ #category : #accessing }
REGClass >> name: anObject [
	name := anObject
]

{ #category : #accessing }
REGClass >> superclass [
	^ superclass
]

{ #category : #accessing }
REGClass >> superclass: anObject [
	superclass := anObject
]
