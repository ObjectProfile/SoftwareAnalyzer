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
	m resolveBindings.
	^ m
]

{ #category : #examples }
SAJExample >> exampleWallet [
	<script: 'self new exampleWallet inspect'>
	| m fr |
	m := SAJModel new.
	
	fr := '/Users/alexandrebergel/Dropbox/GitRepos/SoftwareAnalyzer/data/example.xml' asFileReference.
	fr readStream encoding: (ZnUTF8Encoder new).
	m addSrcMLXML: fr contents.
	m resolveBindings.
	m importFeaturesAsCSV: SAJTest new featureAnnotations.
	^ m
]
