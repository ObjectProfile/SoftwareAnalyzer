Class {
	#name : #SAJClass,
	#superclass : #SAJUnit,
	#instVars : [
		'superclass',
		'superclassName',
		'interfaces',
		'interfaceNames'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #testing }
SAJClass >> hasSuperclass [
	^ superclass notNil
]

{ #category : #accessing }
SAJClass >> interfaceNames [
	^ interfaceNames
]

{ #category : #accessing }
SAJClass >> interfaceNames: anObject [
	interfaceNames := anObject
]

{ #category : #accessing }
SAJClass >> interfaces [
	^ interfaces
]

{ #category : #accessing }
SAJClass >> interfaces: anObject [
	interfaces := anObject
]

{ #category : #testing }
SAJClass >> isClass [
	^ true
]

{ #category : #'as yet unclassified' }
SAJClass >> numberOfAssertions [

	| t |
	t := self methodTests collect: #numberOfAssertions.
	t ifEmpty: [ ^ 0 ].
	^ t sum
]

{ #category : #'as yet unclassified' }
SAJClass >> numberOfTestMethods [

	^ self methodTests size
]

{ #category : #accessing }
SAJClass >> superclass [
	^ superclass
]

{ #category : #accessing }
SAJClass >> superclass: anObject [
	superclass := anObject
]

{ #category : #accessing }
SAJClass >> superclassName [
	^ superclassName
]

{ #category : #accessing }
SAJClass >> superclassName: aString [
	self assert: [ aString isByteString ].
	self assert: [ (aString includes: $<) not ].
	superclassName := aString
]
