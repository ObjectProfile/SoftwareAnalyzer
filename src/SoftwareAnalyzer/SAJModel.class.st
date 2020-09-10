Class {
	#name : #SAJModel,
	#superclass : #Object,
	#instVars : [
		'units',
		'features',
		'packages'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #private }
SAJModel >> addClassAsXML: xml [
	"PRIVATE METHOD"
	| classname aClass hasSuperclass superclassName |
	classname := ((xml elementAt: 'class') elementAt: 'name') nodes first asString.

	aClass := SAJClass new
					name: classname.
					
	hasSuperclass := xml @ { 'class' . 'super_list' . 'extends' . 'super' }.
	hasSuperclass notNil ifTrue: [ 
		superclassName :=  (xml @ { 'class' . 'super_list' . 'extends' . 'super' }) nodes first nodes first asString.
		aClass superclassName: superclassName.
		 ].	
					
	units add: aClass.
	^ aClass
]

{ #category : #private }
SAJModel >> addInterfaceAsXML: xml [
	"PRIVATE METHOD"
	| interfaceName anInterface |
	interfaceName := ((xml elementAt: 'interface') elementAt: 'name') nodes first asString.
	anInterface := SAJInterface new
					name: interfaceName.
	units add: anInterface.
	^ anInterface
]

{ #category : #public }
SAJModel >> addSrcMLXML: xmlAsString [
	"THIS IS A PUBLIC METHOD TO ADD THINGS IN A MODEL
	xml is a string
	
	Using:
	srcml *.java -o example.xml
	"
	| someClasses |
	self assert: [ xmlAsString isByteString ] description: 'Wrong type'.
	someClasses := (XMLDOMParser parse: xmlAsString) document
		descendantNodesSelect: [ :x | (x class ~~ XMLString) and: [ x name = 'unit' and: [ x attributes includesKey: 'filename' ] ] ].
		
	someClasses do: [ :u | self addUnitAsXML: u ]
]

{ #category : #private }
SAJModel >> addUnitAsXML: xml [
	| u hasPackageName |
	self assert: [ xml class name beginsWith: 'XML' ] description: 'Wrong type'.
	(xml elementAt: 'class') ifNotNil: [ u := self addClassAsXML: xml ].
	(xml elementAt: 'interface') ifNotNil: [ u := self addInterfaceAsXML: xml ].
	"Could be enum"
	u ifNil: [ ^ self ].
	u loc: xml asString lines size.
	
	hasPackageName := (xml @ { 'package' . 'name' }) notNil.
	hasPackageName ifTrue: [
		| packageName |
		((xml @ { 'package' . 'name' }) nodes size == 1) 
			ifTrue: [ packageName := (xml @ { 'package' . 'name' }) nodes first asString ]
			ifFalse: [ packageName := (xml @ { 'package' . 'name' }) nodes flatCollect: [ :n | n nodes first asString ] as: String].
		
		u packageName: packageName ].
]

{ #category : #public }
SAJModel >> build [
	self resolveSuperclasses.
	self createAndBindPackages	
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

{ #category : #private }
SAJModel >> createAndBindPackages [
	| packageNames d |
	packageNames := units collect: #packageName.
	d := Dictionary new.
	packageNames do: [ :pName |
		d at: pName put: (SAJPackage new name: pName)	
	].
	packages addAll: d values.
	units do: [ :u |
		u package: (d at: u packageName).
		(d at: u packageName) addUnit: u
		 ]
]

{ #category : #'public - features' }
SAJModel >> featureNamed: aName [
	^ features detect: [ :f | f featureName = aName ]
]

{ #category : #accessing }
SAJModel >> features [
	^ features
]

{ #category : #'public - features' }
SAJModel >> getOrCreateFeatureNamed: aName [
	| doesExist |
	doesExist := features anySatisfy: [ :f | f featureName = aName ].
	doesExist ifFalse: [ features add: (SAJFeature new featureName: aName) ].
	^ features detect: [ :f | f featureName = aName ].
]

{ #category : #'visualization - not interesting' }
SAJModel >> gtInspectorView2In: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Features2';
		initializeCanvas: [ self visualizeFeaturesOnly2 ]
]

{ #category : #visualization }
SAJModel >> gtInspectorViewAnnotationsIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'AnnoOnCode';
		initializeCanvas: [ self visualizeAnnotations ]
]

{ #category : #'visualization - not interesting' }
SAJModel >> gtInspectorViewFeatureIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'AnnoOnCode';
		initializeCanvas: [ self visualizeFeatures ]
]

{ #category : #'visualization - not interesting' }
SAJModel >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Features';
		initializeCanvas: [ self visualizeFeaturesOnly ]
]

{ #category : #'public - features' }
SAJModel >> importFeaturesAsCSV: csvAsString [

	| lines ss unitName from to featureName annotationGranularity feat annotation unit |
	lines := csvAsString lines allButFirst.
	lines do: [ :l |
		ss := l substrings: '.,-'.
		unitName := (ss first substrings: '\') last.
		from := ss third asInteger.
		to := ss fourth asInteger.
		featureName := ss fifth.
		annotationGranularity := ss sixth.
		
		feat := self getOrCreateFeatureNamed: featureName.
		unit := self unitNamed: unitName ifNone: [ nil ].
		
		annotation := SAJFeatureAnnotations new.
		annotation annotationGranularity: annotationGranularity.
		annotation from: from.
		annotation to: to.
		annotation unit: unit.
		unit ifNotNil: [ unit addAnnotation: annotation ].
		annotation feature: feat.
		feat addAnnotation: annotation.
	]
]

{ #category : #initialization }
SAJModel >> initialize [
	super initialize.
	units := OrderedCollection new.
	features := OrderedCollection new.
	packages := OrderedCollection new
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

{ #category : #'public - metrics' }
SAJModel >> numberOfFeatures [
	^ features size
]

{ #category : #'public - metrics' }
SAJModel >> numberOfInterfaces [

	^ self interfaces size
]

{ #category : #'public - metrics' }
SAJModel >> numberOfPackages [
	^ packages size
]

{ #category : #'public - metrics' }
SAJModel >> numberOfUnits [
	^ self numberOfClasses + self numberOfInterfaces
]

{ #category : #accessing }
SAJModel >> packages [
	^ packages
]

{ #category : #private }
SAJModel >> resolveSuperclasses [
	"This is a private method"
	self classes do: [ :cls |
		cls superclassName ifNotNil: [ 
			cls superclass: (self classNamed: cls superclassName ifNone: [ nil ]) ]  ]
]

{ #category : #accessing }
SAJModel >> unitNamed: aName [
	^ units detect: [ :u | u name = aName ]
]

{ #category : #accessing }
SAJModel >> unitNamed: aName ifNone: block [
	^ units detect: [ :u | u name = aName ] ifNone: block
]

{ #category : #accessing }
SAJModel >> units [
	^ units
]

{ #category : #'visualization - not interesting' }
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
	
	RSConditionalLayout new
		ifConnectedThen: RSTreeLayout new;
		else: RSGridLayout new;
		on: classes.
	
	"connectedShapes := classes select: #hasEdges.
	nonConnectedShapes := classes reject: #hasEdges.
	
	RSTreeLayout on: connectedShapes.
	RSGridLayout on: nonConnectedShapes.
	RSLocation new
		left;
		outer;
		offset: -50;
		move: connectedShapes on: nonConnectedShapes.
	RSAlignment new shapes: { connectedShapes . nonConnectedShapes }; top."

	^ c @ RSCanvasController
]

{ #category : #visualization }
SAJModel >> visualizeAnnotations [
	| c cont |
	c := RSCanvas new.
	
	packages do: [ : p |
		cont := RSComposite new.
		self visualizeClasses: p classes inContainer: cont.
		cont color: Color blue. 
		cont padding: 10.
		c add: cont.
	].

	 ^ c @ RSCanvasController
]

{ #category : #visualization }
SAJModel >> visualizeAnnotationsOLD [
	| c classes eb |
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
	
	RSConditionalLayout new
		ifConnectedThen: RSTreeLayout new;
		else: RSGridLayout new;
		on: classes.

	RSNormalizer color
		shapes: classes;
		from: Color gray;
		to: Color red;
		normalize: #numberOfAnnotations.

	 ^ c @ RSCanvasController
]

{ #category : #visualization }
SAJModel >> visualizeClasses: someClasses inContainer: aContainer [
	| eb classes |
	classes := someClasses collect: [ :cls |
		RSBox new model: cls; size: 10 ] as: RSGroup.
	aContainer addAll: classes.
	RSNormalizer size
		shapes: classes;
		normalize: #loc.
	

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
		normalize: #numberOfAnnotations.


]

{ #category : #'visualization - not interesting' }
SAJModel >> visualizeFeatures [
	| c classes eb featureColors featureShapes |
	c := RSCanvas new.
	
	featureShapes := OrderedCollection new.
	featureColors := NSScale category20c.
	
	"classes := self classes collect: [ :cls | RSBox new model: cls ] as: RSGroup."
	classes := self classes collect: [ :cls |
		| g |
		g := cls features collect: [ :f | RSBox new model: f; size: 8; color: (featureColors scale: f) ] as: RSGroup.
		g @ RSPopup.
		featureShapes addAll: g.
		RSGridLayout on: g.
		(g asShapeFor: cls) padding: 5; yourself; color: Color lightGray.
		 ] as: RSGroup. 
	c addAll: classes.
	

	eb := RSEdgeBuilder orthoVertical.
	eb withVerticalAttachPoint.
	eb canvas: c.
	eb shapes: classes.
	eb connectFrom: #superclass.

	classes @ RSPopup @ RSDraggable.
	
	RSConditionalLayout new
		ifConnectedThen: RSTreeLayout new;
		else: RSGridLayout new;
		on: classes.


	featureShapes do: [ :fs |
		fs @ (RSHighlightable new highlightColor: Color red; highlightShapes: [ :ss | featureShapes select: [ :sss | (sss model == fs model) and: [ sss ~~ fs ]  ] ]) ].

	 ^ c @ RSCanvasController
]

{ #category : #'visualization - not interesting' }
SAJModel >> visualizeFeaturesOnly [
	
	| c shapes |
	c := RSCanvas new.
	
	shapes := self features collect: [ :f | RSLabel new text: f featureName; model: f ] as: RSGroup.
	c addAll: shapes.
	
	RSNormalizer fontSize
		shapes: shapes;
		normalize: #numberOfUnits.
		
	RSNormalizer color
		shapes: shapes;
		normalize: #numberOfAnnotations.
	
	RSRectanglePackLayout on: shapes.
	
	
	^ c @ RSCanvasController
]

{ #category : #'visualization - not interesting' }
SAJModel >> visualizeFeaturesOnly2 [
	
	| c shapes eb |
	c := RSCanvas new.
	
	shapes := self features collect: [ :f | RSLabel new text: f featureName; model: f ] as: RSGroup.
	c addAll: shapes.
	shapes @ RSDraggable.
	
	RSNormalizer fontSize
		shapes: shapes;
		normalize: #numberOfUnits.
		
	RSNormalizer color
		shapes: shapes;
		normalize: #numberOfAnnotations.
	
	eb := RSEdgeBuilder line.
	eb shape color: Color veryLightGray.
	eb canvas: c.
	eb moveBehind.
	eb shapes: shapes.
	eb connectToAll: #interactingFeatures.
	
	RSForceBasedLayout new charge: -700; length: 300; on: shapes.
	shapes @ (RSHighlightable new highlightColor: Color blue; highlightShapes: [ :s | 
		shapes select: [ :ss | s model interactingFeatures includes: ss model  ]
		 ]).
	
	^ c @ RSCanvasController
]

{ #category : #'visualization - not interesting' }
SAJModel >> visualizeRaw [
	| c classes eb |
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
	
	RSConditionalLayout new
		ifConnectedThen: RSTreeLayout new;
		else: RSGridLayout new;
		on: classes.

	^ c @ RSCanvasController
]
