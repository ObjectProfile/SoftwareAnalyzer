Class {
	#name : #PharoFeatureTest,
	#superclass : #TestCase,
	#instVars : [
		'm'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #running }
PharoFeatureTest >> setUp [
	super setUp.
	m := PFModel new.
]

{ #category : #tests }
PharoFeatureTest >> testEmpty [

	self assert: m numberOfClasses equals: 0
]
