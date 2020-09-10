Class {
	#name : #REGModule,
	#superclass : #REGUnit,
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #initialization }
REGModule >> initialize [
	super initialize.
	functions := OrderedCollection new.
	classes := OrderedCollection new
]
