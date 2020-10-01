Class {
	#name : #PFModel,
	#superclass : #Object,
	#instVars : [
		'classes'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #adding }
PFModel >> addPharoClass: aClass [
	| c |
	c := PFClass new.
	c pharoClass: aClass.
	classes add: c
]

{ #category : #example }
PFModel >> example [
	<script: 'self new example inspect'>
	| pak m |
	pak := RPackageOrganizer default packageNamed: 'GWBasicVisualization'.
	m := PFModel new.
	pak classes do: [ :c |
		m addPharoClass: c ].
	^ m
]
