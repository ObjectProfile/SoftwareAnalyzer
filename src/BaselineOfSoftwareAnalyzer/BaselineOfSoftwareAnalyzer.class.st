Class {
	#name : #BaselineOfSoftwareAnalyzer,
	#superclass : #BaselineOf,
	#category : #BaselineOfSoftwareAnalyzer
}

{ #category : #baseline }
BaselineOfSoftwareAnalyzer >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'XMLParser' with: [ spec repository: 'github://svenvc/XML-Support-Pharo'; loads: #('core') ];
		baseline: 'Roassal3' with: [ spec repository: 'github://ObjectProfile/Roassal3/src'; loads: #('Full') ];
		baseline: 'GWBasic' with: [ spec repository: 'github://bergel/GWBasic/src' ];
		package: 'SoftwareAnalyzer';

		group: 'default' with: #('XMLParser' 'Roassal3' 'SoftwareAnalyzer');
		group: 'core' with: #('default')
 ]
]
