Class {
	#name : #REGTest,
	#superclass : #TestCase,
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #testing }
REGTest class >> isAbstract [
	^ self = REGTest
]
