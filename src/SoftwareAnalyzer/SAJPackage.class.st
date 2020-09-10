Class {
	#name : #SAJPackage,
	#superclass : #Object,
	#instVars : [
		'units',
		'name'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJPackage >> addUnit: aUnit [
	units add: aUnit
]

{ #category : #accessing }
SAJPackage >> classes [ 
	^ self units select: #isClass
]

{ #category : #initialization }
SAJPackage >> initialize [
	super initialize.
	units := OrderedCollection new.
	name := 'default'
]

{ #category : #accessing }
SAJPackage >> interfaces [ 
	^ self units select: #isInterface
]

{ #category : #accessing }
SAJPackage >> name [
	^ name
]

{ #category : #accessing }
SAJPackage >> name: aString [
	self assert: [ aString notNil ].
	self assert: [ aString isByteString ].
	name := aString
]

{ #category : #visualization }
SAJPackage >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	self name ifNotNil: [ 
		str nextPutAll: self name ].
	str nextPut: $>
]

{ #category : #accessing }
SAJPackage >> units [
	^ units
]

{ #category : #visualization }
SAJPackage >> visualizeAnnotationsIn: container [

	| composite |
	composite := RSComposite new.
	self visualizeClasses: self classes inContainer: composite.
	composite color: Color veryVeryLightGray.
	composite padding: 10.
	composite model: self.
	container add: composite.
	composite @ (RSLabeled new text: self name).
	^ composite
]

{ #category : #visualization }
SAJPackage >> visualizeClasses: someClasses inContainer: aContainer [
	| eb classes compo |
	classes := someClasses collect: [ :cls |
		compo := RSComposite new.
		cls visualizeInContainer: compo.
		compo model: cls.
		compo adjustToChildren.
		compo padding: 10.
		compo ] as: RSGroup.
	aContainer addAll: classes.


	eb := RSEdgeBuilder orthoVertical.
	eb withVerticalAttachPoint.
	eb canvas: aContainer.
	eb shapes: classes.
	eb connectFrom: #superclass.

	classes @ RSPopup @ RSDraggable.
	
	RSConditionalLayout new
		ifConnectedThen: RSTreeLayout new;
		else: RSGridLayout new;
		on: classes.

	RSNormalizer color
		shapes: classes;
		from: Color gray;
		to: Color red;
		normalize: #loc.


]
