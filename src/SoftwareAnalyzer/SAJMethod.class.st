Class {
	#name : #SAJMethod,
	#superclass : #SAJObject,
	#instVars : [
		'name',
		'class',
		'source',
		'xml',
		'annotations'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #accessing }
SAJMethod >> annotations [
	annotations ifNotNil: [ ^ annotations ].
	
	annotations := (xml searchShallowFor: 'annotation') collect: [ :aa | (aa @ { 'name' }) rawString ].
	annotations := annotations asArray.
	^ annotations
]

{ #category : #accessing }
SAJMethod >> class: anSAJClass [

	class := anSAJClass
]

{ #category : #'public - testing' }
SAJMethod >> isTest [

	^ (self name beginsWith: 'test') or: [ self annotations includes: 'Test' ]
]

{ #category : #accessing }
SAJMethod >> name [
	name ifNotNil: [ ^ name ].
	name := (xml @ { 'name'  }) rawString.	
	^ name
]

{ #category : #'public - metrics' }
SAJMethod >> numberOfAssertions [
	^ (((xml searchFor: 'name') collect: #rawString) select: [ :rs |
		'assert*' match: rs
		 ]) size
]

{ #category : #'public - metrics' }
SAJMethod >> numberOfStatements [
	| r |
	r := (xml searchForPattern: '*stmt*') size.
	r > 0 ifTrue: [ ^ r ].

	"A bit hacky"
	^ ((xml @ { 'block' }) nodes select: [ :e | e class == XMLElement ]) size

]

{ #category : #accessing }
SAJMethod >> source [
	"Return the source. Lazily set the source"
	source ifNil: [ 
		self assert: [ xml notNil ].
		source := xml rawString ].
	^ source
]

{ #category : #accessing }
SAJMethod >> xml: anXML [
	self assert: [ anXML class == XMLElement ] description: 'Only XMLElement can be provided'.
	xml := anXML
]
