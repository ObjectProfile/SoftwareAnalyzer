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
PharoFeatureTest >> testBasic [

	| nbOfFeatures fs |
	nbOfFeatures := 2.
	m addPharoClass: PFModel.
	self assert: m numberOfClasses equals: 1.

	fs := m features.
	self assert: fs size > nbOfFeatures.
	self assert: (fs allSatisfy: [ :f | f class == PFFeature ]).
	self assert:
		(m featureNames includesAll: #( 'Modeling' 'Example' 'Adding' )).
	self assert: m numberOfFeatures > nbOfFeatures
]

{ #category : #tests }
PharoFeatureTest >> testClassNamed [
	| c1 c2 |
	m addPharoClass: PFModel.
	m addPharoClass: Object.
	
	c1 := m classNamed: #PFModel.
	c2 := m classNamed: #Object.
	
	self assert: c2 methods size > c1 methods size.
	
	self assert: (m classNamed: #DOESNOTEXIST) isNil
]

{ #category : #tests }
PharoFeatureTest >> testConnection [
	| c |
	"&begin[Adding]"
	m addPharoClass: PFModel.
	"&end[Adding]"
	"&begin[Metric]"
	self assert: m numberOfClasses equals: 1.
	"&end[Metric]"
	
	"&begin[Modeling]"
	c := m classes anyOne.
	self assert: c class equals: PFClass.
	self assert: c model equals: m
	"&end[Modeling]"
]

{ #category : #tests }
PharoFeatureTest >> testEmpty [

	self assert: m numberOfClasses equals: 0
]

{ #category : #tests }
PharoFeatureTest >> testExtractFeatureNames [

	m addPharoClass: PFModel.
	self assert: (m classes anyOne extractFeatureNames includesAll:
			 #( 'Modeling' 'Adding' ))
]

{ #category : #tests }
PharoFeatureTest >> testFeatures [

	| f |
	self assert: m numberOfFeatures equals: 0.
	self assert: m features isEmpty.
	
	self assert: (m featureNamed: 'F1') isNil.
	
	f := m getOrCreateFeatureNamed: 'F1'.
	self assert: f class equals: PFFeature.
	self assert: f name equals: 'F1'.
	self assert: m numberOfFeatures equals: 1.
	self assert: m features notEmpty.
	
	self assert: (m getOrCreateFeatureNamed: 'F1') equals: f

]

{ #category : #tests }
PharoFeatureTest >> testMethods [
	| cls |
	m addPharoClass: PFModel.
	self assert: m numberOfClasses equals: 1.
	
	cls := m classes anyOne.
	self assert: cls methods size equals: PFModel selectors size
]

{ #category : #tests }
PharoFeatureTest >> testPackage [

	| p |
	self assert: m numberOfPackages equals: 0.
	m addPharoClass: PFModel.
	self assert: m numberOfPackages equals: 1.
	self assert: m packages size equals: 1.
	
	p := m packages anyOne.
	self assert: p name equals: PFModel package packageName
]

{ #category : #tests }
PharoFeatureTest >> testPackage2 [
	self assert: m numberOfPackages equals: 0.
	m addPharoClass: PFModel.
	m addPharoClass: Object.
	self assert: m numberOfPackages equals: 2.
	self assert: m packages size equals: 2.
	
	self assert: (m packages collect: #name) asArray equals: #(#SoftwareAnalyzer #Kernel).
	
	self assert: m packages first classes size equals: 1.
	self assert: m packages first classes first package equals: m packages first 
]

{ #category : #tests }
PharoFeatureTest >> testVisualizations [

	m addPharoClass: PFModel.
	m visualizeAnnotations
]
