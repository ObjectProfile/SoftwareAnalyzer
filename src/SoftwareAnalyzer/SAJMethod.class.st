Class {
	#name : #SAJMethod,
	#superclass : #SAJObject,
	#instVars : [
		'name',
		'class',
		'source',
		'xml'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #accessing }
SAJMethod >> class: anSAJClass [

	class := anSAJClass
]

{ #category : #accessing }
SAJMethod >> name [

	^ name
]

{ #category : #accessing }
SAJMethod >> name: aString [

	name := aString
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
SAJMethod >> source: aString [

	source := aString
]

{ #category : #accessing }
SAJMethod >> xml: anXML [
	self assert: [ anXML class == XMLElement ] description: 'Only XMLElement can be provided'.
	xml := anXML
]
