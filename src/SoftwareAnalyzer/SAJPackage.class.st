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

{ #category : #initialization }
SAJPackage >> initialize [
	super initialize.
	units := OrderedCollection new
]

{ #category : #accessing }
SAJPackage >> name [
	^ name
]

{ #category : #accessing }
SAJPackage >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SAJPackage >> units [
	^ units
]
