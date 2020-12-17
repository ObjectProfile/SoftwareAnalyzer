Class {
	#name : #SAJImport,
	#superclass : #SAJObject,
	#instVars : [
		'fullName',
		'fromUnit',
		'toUnit'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #accessing }
SAJImport >> fromUnit [

	^ fromUnit
]

{ #category : #accessing }
SAJImport >> fromUnit: aUnit [

	fromUnit := aUnit
]

{ #category : #accessing }
SAJImport >> fullName [

	^ fullName
]

{ #category : #accessing }
SAJImport >> fullName: aString [

	fullName := aString
]

{ #category : #accessing }
SAJImport >> getClassName [
	^ (fullName substrings: '.') last
]

{ #category : #accessing }
SAJImport >> toUnit [

	^ toUnit
]

{ #category : #accessing }
SAJImport >> toUnit: aUnit [

	toUnit := aUnit
]
