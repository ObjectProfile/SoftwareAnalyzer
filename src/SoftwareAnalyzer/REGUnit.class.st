Class {
	#name : #REGUnit,
	#superclass : #REGObject,
	#instVars : [
		'model',
		'includes',
		'filename',
		'layer',
		'classes',
		'functions',
		'sourceCodeCache',
		'featureAnnotations'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #adding }
REGUnit >> addClass: aClass [
	classes add: aClass
]

{ #category : #adding }
REGUnit >> addFeatureAnnotation: anAnnotation [
	self assert: [ anAnnotation isKindOf: REGFeatureAnnotation ].
	featureAnnotations add: anAnnotation
]

{ #category : #adding }
REGUnit >> addFunction: aFunction [
	self assert: [ aFunction class == REGFunction ].
	functions add: aFunction.
	aFunction module: self
]

{ #category : #adding }
REGUnit >> addInclude: anInclude [
	includes add: anInclude
]

{ #category : #accessing }
REGUnit >> basename [
	^ (filename substrings: '/') last
]

{ #category : #'public - testing' }
REGUnit >> doesInclude: aUnit [

	^ includes anySatisfy: [ :i | i toUnit == aUnit ]
]

{ #category : #accessing }
REGUnit >> featureAnnotations [
	^ featureAnnotations
]

{ #category : #accessing }
REGUnit >> features [
	"Return the feature that contribute to the unit"
	^ (self featureAnnotations collect: #feature) copyWithoutDuplicates
]

{ #category : #accessing }
REGUnit >> filename [
	^ filename
]

{ #category : #accessing }
REGUnit >> filename: aString [
	self assert: [ aString isByteString ] description: 'Wrong type'.
	filename := aString
]

{ #category : #accessing }
REGUnit >> functions [
	functions ifNil: [ ^ #() ].
	^ functions
]

{ #category : #visualization }
REGUnit >> gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: -30>
	composite text
		title: 'Source';
		display: [ self sourceCode ]
]

{ #category : #accessing }
REGUnit >> includes [
	^ includes
]

{ #category : #accessing }
REGUnit >> includes: anObject [
	includes := anObject
]

{ #category : #'as yet unclassified' }
REGUnit >> incomingUnits [
	^ self includes collect: #fromUnit
]

{ #category : #initialization }
REGUnit >> initialize [
	super initialize.
	includes := OrderedCollection new.
	classes := OrderedCollection new.
	functions := OrderedCollection new.
	featureAnnotations := OrderedCollection new
]

{ #category : #testing }
REGUnit >> isHeader [
	^ false
]

{ #category : #testing }
REGUnit >> isModule [
	^ false
]

{ #category : #accessing }
REGUnit >> layer [
	^ layer
]

{ #category : #accessing }
REGUnit >> layer: aLayer [
	layer := aLayer
	
]

{ #category : #accessing }
REGUnit >> model [
	^ model
]

{ #category : #accessing }
REGUnit >> model: aModel [
	model := aModel
]

{ #category : #'public - metrics' }
REGUnit >> numberOfClasses [
	^ classes size
]

{ #category : #'public - metrics' }
REGUnit >> numberOfFeatureAnnotations [
	^ featureAnnotations size
]

{ #category : #'public - metrics' }
REGUnit >> numberOfFeatures [ 
	^ featureAnnotations size
]

{ #category : #'public - metrics' }
REGUnit >> numberOfFunctions [
	functions ifNil: [ ^ 0 ].
	^ functions size
]

{ #category : #'as yet unclassified' }
REGUnit >> numberOfIncludes [
	^ includes size
]

{ #category : #'as yet unclassified' }
REGUnit >> outgoingUnits [
	^ (self includes collect: #toUnit) copyWithout: nil
]

{ #category : #'as yet unclassified' }
REGUnit >> outgoingUnitsToward: unit [
	^ self includes collect: [ :u | u toUnit == unit ]
]

{ #category : #accessing }
REGUnit >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self basename.
	str nextPut: $>.
]

{ #category : #public }
REGUnit >> sourceCode [
	| fr |
	sourceCodeCache ifNotNil: [ ^ sourceCodeCache ].
	((self model isNil or: [ 
	 self model rootFilename isNil ]) or: [
	 self model rootFilename isEmpty ]) ifTrue: [ ^ '' ].
	fr := (self model rootFilename, '/', self filename) asFileReference.
	fr exists ifFalse: [ ^ '' ].
	^ fr contents
]

{ #category : #accessing }
REGUnit >> sourceCodeCache [

	^ sourceCodeCache
]

{ #category : #accessing }
REGUnit >> sourceCodeCache: sourceCodeAsString [
	"set the source code cache. When set, there is no need for file system"
	sourceCodeCache := sourceCodeAsString
]
