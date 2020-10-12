Class {
	#name : #BaselineOfSoftwareAnalyzer,
	#superclass : #BaselineOf,
	#category : #BaselineOfSoftwareAnalyzer
}

{ #category : #baseline }
BaselineOfSoftwareAnalyzer >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'XMLParser' with: [ spec repository: 'github://svenvc/XML-Support-Pharo' ];
		baseline: 'Roassal3' with: [ spec repository: 'github://ObjectProfile/Roassal3/src'; loads: #('Full') ];
		package: 'SoftwareAnalyzer';

		group: 'default' with: #('XMLParser' 'Roassal3' 'SoftwareAnalyzer');
		group: 'core' with: #('default')
 ]
]
