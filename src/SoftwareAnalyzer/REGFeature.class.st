Class {
	#name : #REGFeature,
	#superclass : #REGObject,
	#instVars : [
		'name',
		'annotations',
		'units',
		'parent'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #adding }
REGFeature >> addAnnotation: anAnnotation [
	annotations add: anAnnotation
]

{ #category : #initialization }
REGFeature >> addUnit: aUnit [
	units add: aUnit
]

{ #category : #initialization }
REGFeature >> initialize [
	super initialize.
	units := OrderedCollection new.
	annotations := OrderedCollection new
]

{ #category : #accessing }
REGFeature >> name [

	^ name
]

{ #category : #accessing }
REGFeature >> name: anObject [

	name := anObject
]

{ #category : #accessing }
REGFeature >> parent [
	"Return the parent feature. May return nil if does not have any"
	^ parent
]

{ #category : #accessing }
REGFeature >> parent: aParentFeature [
	"Set the parent feature"
	parent := aParentFeature
]
