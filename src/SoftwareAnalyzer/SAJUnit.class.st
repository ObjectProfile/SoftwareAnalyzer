Class {
	#name : #SAJUnit,
	#superclass : #SAJObject,
	#instVars : [
		'name',
		'methods'
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
