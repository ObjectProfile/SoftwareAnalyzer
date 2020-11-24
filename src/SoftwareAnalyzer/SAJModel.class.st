Class {
	#name : #SAJModel,
	#superclass : #Object,
	#instVars : [
		'units',
		'features',
		'packages',
		'featureColorScale',
		'rootFilename'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #private }
SAJModel >> addClassAsXML: xml [
	"PRIVATE METHOD"
	| classname aClass hasSuperclass superclassName isGeneric |
	classname := ((xml elementAt: 'class') elementAt: 'name') nodes first asString.

	aClass := SAJClass new
					name: classname.
					
	hasSuperclass := xml @ { 'class' . 'super_list' . 'extends' . 'super' }.
	hasSuperclass notNil ifTrue: [ 
		isGeneric := (xml @ { 'class' . 'super_list' . 'extends' . 'super' }) nodes first nodes size > 1.
		isGeneric 
			ifTrue: [ 
				superclassName :=  (xml @ { 'class' . 'super_list' . 'extends' . 'super' }) nodes first nodes first nodes first asString ]
			ifFalse: [
				superclassName :=  (xml @ { 'class' . 'super_list' . 'extends' . 'super' }) nodes first nodes first asString ].
		aClass superclassName: superclassName.
		 ].	
					
	units add: aClass.
	^ aClass
]

{ #category : #private }
SAJModel >> addEnumAsXML: xml [
	"PRIVATE METHOD"
	| enumName anEnum |
	enumName := ((xml elementAt: 'enum') elementAt: 'name') nodes first asString.
	anEnum := SAJEnum new
					name: enumName.
	units add: anEnum.
	^ anEnum
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
	| u hasPackageName filename |
	self assert: [ xml class name beginsWith: 'XML' ] description: 'Wrong type'.
	(xml elementAt: 'class') ifNotNil: [ u := self addClassAsXML: xml ].
	(xml elementAt: 'interface') ifNotNil: [ u := self addInterfaceAsXML: xml ].
	(xml elementAt: 'enum') ifNotNil: [ u := self addEnumAsXML: xml ].
	filename := xml attributeAt: 'filename'.

	u ifNil: [ self halt. ].
	
	u loc: xml asString lines size.
	u model: self.
	u filename: filename.
	
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
	self createAndBindPackages.
	self computeFeatureColor	
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

{ #category : #public }
SAJModel >> computeFeatureColor [	
	self features do: [ :f |
		f color: (self scaleForFeaturesColoring scale: f) ]
	
]

{ #category : #private }
SAJModel >> createAndBindPackages [
	| packageNames d |
	packageNames := units collect: #packageName.
	d := Dictionary new.
	packageNames do: [ :pName |
		d at: pName put: (SAJPackage new name: pName; model: self)	
	].
	packages addAll: d values.
	units do: [ :u |
		u package: (d at: u packageName).
		(d at: u packageName) addUnit: u
		 ]
]

{ #category : #visualization }
SAJModel >> createColorScaleForFeatures [
	"Return a scale ready to be used to color feature"
	^ NSScale ordinalColored: self numberOfFeatures
	
]

{ #category : #'public - metrics' }
SAJModel >> enums [

	^ units select: #isEnum
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
	doesExist ifFalse: [ features add: (SAJFeature new featureName: aName; model: self) ].
	^ features detect: [ :f | f featureName = aName ].
]

{ #category : #visualization }
SAJModel >> gtInspectorFeatureInteractionIn: composite [
	<gtInspectorPresentationOrder: -90>
	composite roassal3
		title: 'Feat. Int.';
		initializeCanvas: [ self visualizeFeatureInteraction ]
]

{ #category : #visualization }
SAJModel >> gtInspectorFeatureListIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite table
		title: [ 'Features' translated ];
		display: [ self features ];
		column: 'Name' evaluated: [ :each | each featureName ];
		column: '#Annotations' evaluated: [ :each | each numberOfAnnotations ];
		column: '#Units' evaluated: [ :each | each numberOfUnits ]
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
	<gtInspectorPresentationOrder: -50>
	composite roassal3
		title: 'F';
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
		
		"to cannot be inferior than from"
		to := ss fourth asInteger max: from.
		featureName := ss fifth.
		annotationGranularity := ss sixth.
		
		feat := self getOrCreateFeatureNamed: featureName.
		unit := self unitNamed: unitName ifNone: [ nil ].
		
		annotation := SAJFeatureAnnotations new.
		annotation annotationGranularity: annotationGranularity.
		annotation from: from.
		annotation to: to.
		annotation unit: unit.
		unit ifNotNil: [ 
			unit addAnnotation: annotation.
			annotation feature: feat.
			feat addAnnotation: annotation  ] "ifNil: [ self halt ]".
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
SAJModel >> numberOfEnums [

	^ self enums size
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
	^ units size
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
SAJModel >> rootFilename [
	^ rootFilename
]

{ #category : #accessing }
SAJModel >> rootFilename: aString [
	"Set the root of the folder that contains the application source code"
	rootFilename := aString
]

{ #category : #visualization }
SAJModel >> scaleForFeaturesColoring [
	"Return a scale ready to be used to color feature"
	featureColorScale ifNotNil: [ ^ featureColorScale ].
	featureColorScale := NSScale ordinal range: (Color wheel: self numberOfFeatures).
	^ featureColorScale
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
	| c pShapes featureShapes |
	c := RSCanvas new.
	
	"We render packages"
	pShapes := packages collect: [ : p |
		p visualizeAnnotationsIn: c
	] as: RSGroup.
	RSGridLayout on: pShapes.
	
	featureShapes := c deepShapesFromModels: self features.
	"self assert: [ featureShapes notEmpty ]."

	featureShapes do: [ :fs |
		fs @ (RSHighlightable new highlightBorder: (RSBorder new color: Color yellow; width: 5); highlightShapes: [ :ss | featureShapes select: [ :sss | (sss model == fs model) and: [ sss ~~ fs ]  ] ]) ].
	
	pShapes @ RSPopup @ RSDraggable.
	 ^ c @ RSCanvasController
]

{ #category : #'visualization - not interesting' }
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
SAJModel >> visualizeFeatureInteraction [


	| c m allPackages featureLabels channel |
	c := RSCanvas new.
	c inspectorContext interactionsToBeRegistered removeAll.
	
	"packages and classes"
	m := RSMondrian new.
	m canvas: c.
	m shape box color: Color gray lighter lighter lighter.
	m nodes: self packages forEach: [ :pak |
		m shape box size: [ :cc | cc loc sqrt * 2 ].
		m nodes: pak classes.
		m orthoVerticalLine connectFrom: #superclass.
		m layout ifConnected: RSTreeLayout new ifNotConnected: (RSFlowLayout new gapSize: 20).
	].
	m layout flow gapSize: 30.
	m build.
	allPackages := c nodes copy.
	allPackages @ (RSLabeled new text: [ :pak | pak name ]).

	"Features"
	featureLabels := (self features sortedAs: #name) collect: [ :f | RSLabel new text: f name; model: f ] as: RSGroup.
	RSNormalizer fontSize
		shapes: featureLabels;
		from: 10; to: 20;
		normalize: #numberOfUnits.
	RSFlowLayout new maxWidth: 700; on: featureLabels.
	c addAll: featureLabels.
	RSVerticalLineLayout new gapSize: 40; on: { featureLabels . allPackages }.
	featureLabels do: [ :aFeatLabel |
		channel := RSChannel new.
		channel color: aFeatLabel model color.
		channel input: { aFeatLabel } asGroup.
		channel output: (c deepShapesFromModels: aFeatLabel model units).
		channel build.
	].

	c @ RSCanvasController.
	^ c
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
