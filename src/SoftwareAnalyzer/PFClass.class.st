Class {
	#name : #PFClass,
	#superclass : #PFStructuralElement,
	#instVars : [
		'pharoClass',
		'methodsCache',
		'package',
		'superclass'
	],
	#category : #'SoftwareAnalyzer-PharoFeature'
}

{ #category : #'as yet unclassified' }
PFClass >> extractFeatureNames [
	^ self methods flatCollect: #extractFeatureNames
]

{ #category : #accessing }
PFClass >> features [
	^ (self methods flatCollect: #features) copyWithoutDuplicates
]

{ #category : #accessing }
PFClass >> methods [
	methodsCache ifNotNil: [ ^ methodsCache ].
	methodsCache := pharoClass methods collect: [ :cm |
				PFMethod new class: self; compiledMethod: cm ].
	^ methodsCache
]

{ #category : #accessing }
PFClass >> package [
	^ package
]

{ #category : #accessing }
PFClass >> package: aPFPackage [
	package := aPFPackage
]

{ #category : #accessing }
PFClass >> pharoClass [
	^ pharoClass
]

{ #category : #accessing }
PFClass >> pharoClass: aPharoClass [
	self assert: [ aPharoClass isBehavior ].
	pharoClass := aPharoClass.
	self name: pharoClass name
]

{ #category : #accessing }
PFClass >> superclass [
	^ superclass
]

{ #category : #accessing }
PFClass >> superclass: aPFClass [
	superclass := aPFClass
]

{ #category : #accessing }
PFClass >> superclassName [
	^ self pharoClass superclass name
]

{ #category : #visualization }
PFClass >> visualizeClasses: someClasses inContainer: aContainer [
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

{ #category : #visualization }
PFClass >> visualizeInContainer: compo [
	self features do: [ :feat |
		compo add: (RSBox new model: self; size: 10; model: feat; color: (feat color)).
	].
	compo children @ RSPopup.
	RSGridLayout on: compo children.
	

]
