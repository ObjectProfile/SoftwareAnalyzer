Class {
	#name : #REGHeader,
	#superclass : #REGUnit,
	#instVars : [
		'module'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #testing }
REGHeader >> isHeader [
	^ true
]

{ #category : #testing }
REGHeader >> isModule [
	^ false
]
