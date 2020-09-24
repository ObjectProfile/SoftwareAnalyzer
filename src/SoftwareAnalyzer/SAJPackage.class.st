Class {
	#name : #SAJPackage,
	#superclass : #SAJStructuralElement,
	#instVars : [
		'units'
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
	| eb classes compo sc |
	classes := someClasses collect: [ :cls |
		compo := RSComposite new.
		compo color: Color gray darker.
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

"	sc := RSNormalizer color.
	sc
		shapes: classes;
		from: Color gray;
		to: Color red.
	sc scale domain: { (self model units detectMin: #loc) loc . (self model units detectMax: #loc) loc }.
	sc
		normalize: #loc.
"

]
