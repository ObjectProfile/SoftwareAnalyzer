Class {
	#name : #SAJFeatureAnnotations,
	#superclass : #SAJObject,
	#instVars : [
		'unit',
		'feature',
		'annotationGranularity',
		'from',
		'to',
		'filename'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #accessing }
SAJFeatureAnnotations >> annotationGranularity [
	^ annotationGranularity
]

{ #category : #accessing }
SAJFeatureAnnotations >> annotationGranularity: anObject [
	annotationGranularity := anObject
]

{ #category : #accessing }
SAJFeatureAnnotations >> feature [
	^ feature
]

{ #category : #accessing }
SAJFeatureAnnotations >> feature: anObject [
	feature := anObject
]

{ #category : #accessing }
SAJFeatureAnnotations >> filename [
	^ filename
]

{ #category : #accessing }
SAJFeatureAnnotations >> filename: anObject [
	filename := anObject
]

{ #category : #accessing }
SAJFeatureAnnotations >> from [
	^ from
]

{ #category : #accessing }
SAJFeatureAnnotations >> from: anObject [
	from := anObject
]

{ #category : #accessing }
SAJFeatureAnnotations >> to [
	^ to
]

{ #category : #accessing }
SAJFeatureAnnotations >> to: anObject [
	to := anObject
]

{ #category : #accessing }
SAJFeatureAnnotations >> unit [
	^ unit
]

{ #category : #accessing }
SAJFeatureAnnotations >> unit: anObject [
	unit := anObject
]
