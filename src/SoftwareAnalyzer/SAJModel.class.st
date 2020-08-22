Class {
	#name : #SAJModel,
	#superclass : #Object,
	#instVars : [
		'units',
		'features'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJModel >> addClassAsXML: xml [
	| classname aClass hasSuperclass superclassName |
	classname := ((xml elementAt: 'class') elementAt: 'name') nodes first asString.

	hasSuperclass := xml @ { 'class' . 'super_list' . 'extends' . 'super' }.

	hasSuperclass notNil ifTrue: [ 
		superclassName :=  (xml @ { 'class' . 'super_list' . 'extends' . 'super' }) nodes first nodes first asString.
		 ].
	
	
	aClass := SAJClass new
					name: classname;
					superclassName: superclassName.
	units add: aClass.
	^ aClass
]

{ #category : #adding }
SAJModel >> addInterfaceAsXML: xml [
	| interfaceName anInterface |
	interfaceName := ((xml elementAt: 'interface') elementAt: 'name') nodes first asString.
	anInterface := SAJInterface new
					name: interfaceName.
	units add: anInterface.
	^ anInterface
]

{ #category : #adding }
SAJModel >> addSrcMLXML: xml [
	"xml as string
	
	Using:
	srcml *.java -o example.xml
	"
	| someClasses |
	someClasses := (XMLDOMParser parse: xml) document
		descendantNodesSelect: [ :x | (x class ~~ XMLString) and: [ x name = 'unit' and: [ x attributes includesKey: 'filename' ] ] ].
		
	someClasses do: [ :u | self addUnitAsXML: u ]
]

{ #category : #adding }
SAJModel >> addUnitAsXML: xml [
	| u |
	(xml elementAt: 'class') ifNotNil: [ u := self addClassAsXML: xml ].
	(xml elementAt: 'interface') ifNotNil: [ u := self addInterfaceAsXML: xml ].
	
	"Could be enum"
	u ifNil: [ ^ self ].
	u loc: xml asString lines size
]

{ #category : #accessing }
SAJModel >> classNamed: aClassName [
	^ self classes detect: [ :cls | cls name = aClassName ]
]

{ #category : #accessing }
SAJModel >> classNamed: aClassName ifNone: block [
	^ self classes detect: [ :cls | cls name = aClassName ] ifNone: block
]

{ #category : #'public - metrics' }
SAJModel >> classes [

	^ units select: #isClass
]

{ #category : #'public - features' }
SAJModel >> featureNamed: aName [
	^ features detect: [ :f | f featureName = aName ]
]

{ #category : #'public - features' }
SAJModel >> getOrCreateFeatureNamed: aName [
	| doesExist |
	doesExist := features anySatisfy: [ :f | f featureName = aName ].
	doesExist ifFalse: [ features add: (SAJFeature new featureName: aName) ].
	^ features detect: [ :f | f featureName = aName ].
]

{ #category : #visualization }
SAJModel >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'View';
		initializeCanvas: [ self visualize ]
]

{ #category : #'public - features' }
SAJModel >> importFeaturesAsCSV: csvAsString [

	| lines ss unitName from to featureName annotationGranularity feat annotation |
	lines := csvAsString lines allButFirst.
	lines do: [ :l |
		ss := l substrings: '.,-'.
		unitName := (ss first substrings: '\') last.
		from := ss third asInteger.
		to := ss fourth asInteger.
		featureName := ss fifth.
		annotationGranularity := ss sixth.
		
		feat := self getOrCreateFeatureNamed: featureName.
		
		annotation := SAJFeatureAnnotations new.
		annotation annotationGranularity: annotationGranularity.
		annotation from: from.
		annotation to: to.
		annotation unit: (self unitNamed: unitName ifNone: [ nil ]).
		annotation feature: feat.
		feat addAnnotation: annotation.
	]
]

{ #category : #initialization }
SAJModel >> initialize [
	super initialize.
	units := OrderedCollection new.
	features := OrderedCollection new
]

{ #category : #accessing }
SAJModel >> interfaceNamed: aClassName [
	^ self interfaces detect: [ :cls | cls name = aClassName ]
]

{ #category : #'public - metrics' }
SAJModel >> interfaces [

	^ units select: #isInterface
]

{ #category : #'public - metrics' }
SAJModel >> numberOfClasses [

	^ self classes size
]

{ #category : #'as yet unclassified' }
SAJModel >> numberOfFeatures [
	^ features size
]

{ #category : #'public - metrics' }
SAJModel >> numberOfInterfaces [

	^ self interfaces size
]

{ #category : #'as yet unclassified' }
SAJModel >> resolveBindings [
	self classes do: [ :cls |
		cls superclassName ifNotNil: [ 
			cls superclass: (self classNamed: cls superclassName ifNone: [ nil ]) ]  ]
]

{ #category : #'as yet unclassified' }
SAJModel >> unitNamed: aName [
	^ units detect: [ :u | u name = aName ]
]

{ #category : #'as yet unclassified' }
SAJModel >> unitNamed: aName ifNone: block [
	^ units detect: [ :u | u name = aName ] ifNone: block
]

{ #category : #visualization }
SAJModel >> visualize [
	| c classes eb connectedShapes nonConnectedShapes |
	c := RSCanvas new.
	
	classes := self classes collect: [ :cls | RSBox new model: cls ] as: RSGroup.
	c addAll: classes.
	RSNormalizer size
		shapes: classes;
		normalize: #loc.
	

	eb := RSEdgeBuilder orthoVertical.
	eb withVerticalAttachPoint.
	eb canvas: c.
	eb shapes: classes.
	eb connectFrom: #superclass.

	classes @ RSPopup @ RSDraggable.
	
	connectedShapes := classes select: #hasEdges.
	nonConnectedShapes := classes reject: #hasEdges.
	
	RSTreeLayout on: connectedShapes.
	RSGridLayout on: nonConnectedShapes.
	RSLocation new
		left;
		outer;
		offset: -50;
		move: connectedShapes on: nonConnectedShapes.
	RSAlignment new shapes: { connectedShapes . nonConnectedShapes }; top.
	
	 classes.
	^ c @ RSCanvasController
]
