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

{ #category : #printing }
SAJFeatureAnnotations >> featureName [
	^ self feature name
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

{ #category : #'as yet unclassified' }
SAJFeatureAnnotations >> gtInspectorSourceCodeIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'Source';
		display: #sourceCode
]

{ #category : #printing }
SAJFeatureAnnotations >> printOn: str [
	| s |
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self featureName.
	str nextPut: $>.
	
	str lf.
	
	s := self sourceCode lines.
	s size > 15 ifTrue: [
		str nextPutAll: (String lf join: (s first: 15)).
		str lf.
		str nextPutAll: '........' ]
		ifFalse: [ str nextPutAll: self sourceCode ]
]

{ #category : #accessing }
SAJFeatureAnnotations >> sourceCode [
	| lines numberOfLines |
	lines := self unit sourceCode lines.
	numberOfLines := lines size.
	^ String cr join: (lines copyFrom: (self from min: numberOfLines) to: (self to min: numberOfLines))
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
