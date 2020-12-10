Class {
	#name : #REGFeatureAnnotation,
	#superclass : #REGObject,
	#instVars : [
		'name',
		'unit',
		'feature',
		'startLine',
		'endLine',
		'parentAnnotation',
		'children'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #adding }
REGFeatureAnnotation >> addChildrenAnnotation: anAnnotation [
	children add: anAnnotation
]

{ #category : #accessing }
REGFeatureAnnotation >> children [
	"Return the children feature annotations"
	^ children
]

{ #category : #accessing }
REGFeatureAnnotation >> endLine [

	^ endLine
]

{ #category : #accessing }
REGFeatureAnnotation >> endLine: anInteger [

	endLine := anInteger
]

{ #category : #accessing }
REGFeatureAnnotation >> feature [

	^ feature
]

{ #category : #accessing }
REGFeatureAnnotation >> feature: anObject [

	feature := anObject
]

{ #category : #initialization }
REGFeatureAnnotation >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : #accessing }
REGFeatureAnnotation >> name [

	^ name
]

{ #category : #accessing }
REGFeatureAnnotation >> name: aNameAsString [

	name := aNameAsString
]

{ #category : #accessing }
REGFeatureAnnotation >> parentAnnotation [
	"Return the parent feature annotation. May be nil if none"
	^ parentAnnotation
]

{ #category : #accessing }
REGFeatureAnnotation >> parentAnnotation: aParentFeatureAnnoration [
	"Set the parent feature annotation. This happens in case of nested feature annotation"
	parentAnnotation := aParentFeatureAnnoration
]

{ #category : #accessing }
REGFeatureAnnotation >> startLine [

	^ startLine
]

{ #category : #accessing }
REGFeatureAnnotation >> startLine: anInteger [

	startLine := anInteger
]

{ #category : #accessing }
REGFeatureAnnotation >> unit [

	^ unit
]

{ #category : #accessing }
REGFeatureAnnotation >> unit: aREGUnit [

	unit := aREGUnit
]
