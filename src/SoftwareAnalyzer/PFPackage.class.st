Class {
	#name : #PFPackage,
	#superclass : #PFStructuralElement,
	#instVars : [
		'packageName',
		'classes'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #initialization }
PFPackage >> addClass: aPFClass [
	classes add: aPFClass
]

{ #category : #initialization }
PFPackage >> initialize [
	super initialize.
	classes := OrderedCollection new
]
