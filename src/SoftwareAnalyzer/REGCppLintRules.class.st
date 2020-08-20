Class {
	#name : #REGCppLintRules,
	#superclass : #Object,
	#instVars : [
		'file',
		'lineOfCode',
		'description',
		'rules'
	],
	#category : #SoftwareAnalyzer
}

{ #category : #accessing }
REGCppLintRules >> description [
	^ description
]

{ #category : #accessing }
REGCppLintRules >> description: anObject [
	description := anObject
]

{ #category : #accessing }
REGCppLintRules >> file [
	^ file
]

{ #category : #accessing }
REGCppLintRules >> file: anObject [
	file := anObject
]

{ #category : #'instance creation' }
REGCppLintRules >> fromString: aString [
	| lines |
	lines := aString lines.
	lines do: [ :line | self processLine: line ].
	^ rules
]

{ #category : #visualization }
REGCppLintRules >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'Summary';
		display: [ self summaryAsString ]
]

{ #category : #'instance creation' }
REGCppLintRules >> initialize [
	super initialize.
	rules := OrderedCollection new.
]

{ #category : #accessing }
REGCppLintRules >> lineOfCode [
	^ lineOfCode
]

{ #category : #accessing }
REGCppLintRules >> lineOfCode: anObject [
	lineOfCode := anObject
]

{ #category : #'as yet unclassified' }
REGCppLintRules >> processLine: aLine [
	| ind tt |
	(aLine beginsWith: 'Ignoring') ifTrue: [ ^ self ].
	
	ind := aLine indexOf: $ .
	tt := (aLine first: ind) substrings: ':'.
	file := tt first.
	lineOfCode := tt second asInteger.
	
	description := aLine copyFrom: ind + 1 to: aLine size.
	
	rules add: (REGCppLintRules new file: file; lineOfCode: lineOfCode; description: description).
	
]

{ #category : #accessing }
REGCppLintRules >> rules [
	^ rules
]

{ #category : #accessing }
REGCppLintRules >> rules: anObject [
	rules := anObject
]

{ #category : #visualization }
REGCppLintRules >> summaryAsMarkdown [

	| d t |
	d := rules groupedBy: #description.
	t := (d associations sortedAs: [ :ass | ass value size ]) reversed.
	
	t := (t collect: [ :as | as value size asString, '|', as key]).
	t := {'Nb Occurence|Description' . '---|---' }, t.
	^ String lf join: t
]

{ #category : #visualization }
REGCppLintRules >> summaryAsString [

	| d t |
	d := rules groupedBy: #description.
	t := (d associations sortedAs: [ :ass | ass value size ]) reversed.
	
	^ String lf join: (t collect: [ :as | as value size asString, ': ', as key])
]
