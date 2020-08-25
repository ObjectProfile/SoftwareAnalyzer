Class {
	#name : #SAJFeature,
	#superclass : #SAJObject,
	#instVars : [
		'featureName',
		'annotations'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #initialization }
SAJFeature >> addAnnotation: aFeatureAnnotation [
	annotations add: aFeatureAnnotation
]

{ #category : #accessing }
SAJFeature >> annotations [
	^ annotations
]

{ #category : #accessing }
SAJFeature >> featureName [
	^ featureName
]

{ #category : #accessing }
SAJFeature >> featureName: anObject [
	featureName := anObject
]

{ #category : #initialization }
SAJFeature >> initialize [
	super initialize.
	annotations := OrderedCollection new
]

{ #category : #'as yet unclassified' }
SAJFeature >> interactingFeatures [
	^ (self units flatCollect: #features) asSet
]

{ #category : #'as yet unclassified' }
SAJFeature >> numberOfAnnotations [
	^ annotations size
]

{ #category : #'as yet unclassified' }
SAJFeature >> numberOfUnits [

	^ self units asSet size
]

{ #category : #printing }
SAJFeature >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self featureName.
	str nextPut: $>.
]

{ #category : #'as yet unclassified' }
SAJFeature >> units [

	^ (annotations collect: #unit) select: #notNil
]
