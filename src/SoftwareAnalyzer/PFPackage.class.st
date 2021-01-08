Class {
	#name : #PFPackage,
	#superclass : #PFStructuralElement,
	#instVars : [
		'classes'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #initialization }
PFPackage >> addClass: aPFClass [
	classes add: aPFClass
]

{ #category : #accessing }
PFPackage >> classes [
	^ classes
]

{ #category : #initialization }
PFPackage >> initialize [
	super initialize.
	classes := OrderedCollection new
]

{ #category : #visualization }
PFPackage >> visualizeAnnotationsIn: container [
	
	| composite |
	composite := RSComposite new.
	self visualizeClasses: self classes inContainer: composite.
	composite color: Color veryVeryLightGray.
	composite padding: 10.
	composite model: self.
	container add: composite.
	composite adjustToChildren.
	composite @ (RSLabeled new text: self name asString).
	^ composite
]

{ #category : #visualization }
PFPackage >> visualizeClasses: someClasses inContainer: aContainer [
	| eb   ccClasses compo |
	ccClasses := someClasses collect: [ :cls |
		compo := RSComposite new.
		compo color: Color gray darker.
		cls visualizeInContainer: compo.
		compo model: cls.
		compo adjustToChildren.
		compo padding: 10.
		compo ] as: RSGroup.
	aContainer addAll: ccClasses.


	eb := RSEdgeBuilder orthoVertical.
	eb withVerticalAttachPoint.
	eb canvas: aContainer.
	eb shapes: ccClasses.
	eb connectFrom: #superclass.

	ccClasses @ RSPopup @ RSDraggable.
	
	RSConditionalLayout new
		ifConnectedThen: RSTreeLayout new;
		else: RSGridLayout new;
		on: ccClasses.

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
