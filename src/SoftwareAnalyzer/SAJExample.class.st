Class {
	#name : #SAJExample,
	#superclass : #Object,
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #examples }
SAJExample >> exampleSimple [
	<script: 'self new exampleSimple inspect'>
	| m |
	m := SAJModel new.
	m addSrcMLXML: SAJTest new sourceCodeExampleXML.
	m build.
	^ m
]

{ #category : #examples }
SAJExample >> exampleWallet [
	<script: 'self new exampleWallet inspect'>
	| m fr |
	m := SAJModel new.
	m rootFilename: '/Users/alexandrebergel/Dropbox/GitRepos/datasetbitcoinwallet/src'.
	fr := '/Users/alexandrebergel/Dropbox/GitRepos/datasetbitcoinwallet/src/xml' asFileReference.
	fr children do: [ :ffr |
		m addSrcMLXML: ffr contents.
	].	
	m build.
	m importFeaturesAsCSV: SAJTest new featureAnnotations.
	^ m
]
