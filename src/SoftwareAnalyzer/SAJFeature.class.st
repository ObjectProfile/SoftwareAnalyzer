Class {
	#name : #SAJFeature,
	#superclass : #SAJObject,
	#instVars : [
		'fileName',
		'lineRange',
		'featureName',
		'annotationGranularity'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #accessing }
SAJFeature >> annotationGranularity [
	^ annotationGranularity
]

{ #category : #accessing }
SAJFeature >> annotationGranularity: anObject [
	annotationGranularity := anObject
]

{ #category : #accessing }
SAJFeature >> featureName [
	^ featureName
]

{ #category : #accessing }
SAJFeature >> featureName: anObject [
	featureName := anObject
]

{ #category : #accessing }
SAJFeature >> fileName [
	^ fileName
]

{ #category : #accessing }
SAJFeature >> fileName: anObject [
	fileName := anObject
]

{ #category : #accessing }
SAJFeature >> lineRange [
	^ lineRange
]

{ #category : #accessing }
SAJFeature >> lineRange: anObject [
	lineRange := anObject
]
