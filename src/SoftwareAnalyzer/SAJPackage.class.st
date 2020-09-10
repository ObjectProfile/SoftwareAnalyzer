Class {
	#name : #SAJPackage,
	#superclass : #Object,
	#instVars : [
		'units',
		'name'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJPackage >> addUnit: aUnit [
	units add: aUnit
]

{ #category : #accessing }
SAJPackage >> classes [ 
	^ self units select: #isClass
]

{ #category : #initialization }
SAJPackage >> initialize [
	super initialize.
	units := OrderedCollection new.
	name := 'default'
]

{ #category : #accessing }
SAJPackage >> interfaces [ 
	^ self units select: #isInterface
]

{ #category : #accessing }
SAJPackage >> name [
	^ name
]

{ #category : #accessing }
SAJPackage >> name: aString [
	self assert: [ aString notNil ].
	self assert: [ aString isByteString ].
	name := aString
]

{ #category : #accessing }
SAJPackage >> units [
	^ units
]
