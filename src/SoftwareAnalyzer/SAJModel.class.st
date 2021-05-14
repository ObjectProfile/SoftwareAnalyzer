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
	
	When folder may contain source code files
	find . -type f \( -iname \*.java \) -exec srcml {} -o {}.xml \;
	mkdir xml
	find . -name ""*.java.xml"" -exec mv {} xml \;
	"
	| someClasses |
	self assert: [ xmlAsString isByteString ] description: 'Wrong type'.
	someClasses := (XMLDOMParser parse: xmlAsString) document
		descendantNodesSelect: [ :x | (x class ~~ XMLString) and: [ x name = 'unit' and: [ x attributes includesKey: 'filename' ] ] ].
		
	someClasses do: [ :u | self addUnitAsXML: u ]
]

{ #category : #private }
SAJModel >> addUnitAsXML: xml [
	| u hasPackageName filename import |
	self assert: [ xml class name beginsWith: 'XML' ] description: 'Wrong type'.
	(xml elementAt: 'class') ifNotNil: [ u := self addClassAsXML: xml ].
	(xml elementAt: 'interface') ifNotNil: [ u := self addInterfaceAsXML: xml ].
	(xml elementAt: 'enum') ifNotNil: [ u := self addEnumAsXML: xml ].
	filename := xml attributeAt: 'filename'.

	u ifNil: [ "self error: 'Cannot be nil!'" 
		"do nothing"
		^ self ].
	
	u loc: xml rawString lines size.
	u model: self.
	u filename: filename.
	
	"CHECK PACKAGE"
	hasPackageName := (xml @ { 'package' . 'name' }) notNil.
	hasPackageName ifTrue: [
		| packageName |
		((xml @ { 'package' . 'name' }) nodes size == 1) 
			ifTrue: [ packageName := (xml @ { 'package' . 'name' }) nodes first asString ]
			ifFalse: [ packageName := (xml @ { 'package' . 'name' }) nodes flatCollect: [ :n | n nodes first asString ] as: String].
		
		u packageName: packageName ].
	
	"CHECK IMPORTS"
	(xml searchFor: 'import') do: [ :importAsXml |
		import := SAJImport new.
		import fromUnit: u.
		import fullName: ('.' join: ((importAsXml searchFor: 'name') allButFirst collect: #rawString)).
		u addImport: import.
	].

]

{ #category : #public }
SAJModel >> build [
	"Public method"
	self resolveSuperclasses.
	self createAndBindPackages.
	self computeFeatureColor.
	self buildAnnotationHierarchy.
	self resolveImports
]

{ #category : #private }
SAJModel >> buildAnnotationHierarchy [
	"Build annotation for each unit"
	self units do: #buildAnnotationHierarchy
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
SAJModel >> computeFeatureColor [	
	| c |
	c := SAJColoredFeatureTreePalette new.
	c features: self features.
	c assignColor.
"	self features do: [ :f |
		f color: (self scaleForFeaturesColoring scale: f) ]
	"
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

{ #category : #'visualization - not interesting' }
SAJModel >> flow [
	"DOES NOT WORK :-("

	| f aCanvas |
	aCanvas := RSCanvas new.
	aCanvas @ RSCanvasController.
	f := RSFlowCanvas new.
	f setOnCanvas: aCanvas.
	f when: SAJModel visualize: [ :canvas :aModel |
		canvas halt.
		aModel visualizeFeatureInteractionIn: canvas.
		canvas zoomToFit. ].
	f when: SAJUnit visualize: [ :canvas :aUnit | 
		canvas release initialize.
		aUnit visualizeButterflyIn: canvas.
		canvas zoomToFit.
	].
	f clickOnModel: self.
	f open
]

{ #category : #'public - features' }
SAJModel >> getFeatureListFromSourceCode [

	"Produce a CSV file something like:
'fileName,lineRange,featureName,annotationGranualarity
Canvas.java,2-3,Feature1,FRAGMENT
Canvas.java,6-7,Feature2,FRAGMENT
Shape.java,6-7,Feature1,FRAGMENT
Shape.java,6-7,Feature3,FRAGMENT
Shape.java,6-7,Feature4,FRAGMENT
'
"
	| w |
	w := WriteStream on: String new.
	self units do: [ :u |
		self getFeatureListFromSourceCodeFor: u in: w
		 ].
	^ w contents
]

{ #category : #private }
SAJModel >> getFeatureListFromSourceCodeFor: unit in: stream [	
	| stack b |
	stack := OrderedCollection new.
	Halt if: [ unit sourceCode isEmpty ].
	unit sourceCode lines doWithIndex: [ :l :index |
		(('*//&line*(*' match: l) or: [ ('*//&line*[*' match: l) ]) ifTrue: [
				stream nextPutAll: unit filename.
				stream nextPut: $,.
				stream nextPutAll: index asString.
				stream nextPut: $-.
				stream nextPutAll: (index + 1) asString.
				stream nextPut: $,.
				stream nextPutAll: ((l substrings: '&') last substrings: '()[]') last.
				stream nextPutAll: ',LINE'.
				stream cr.	
				].
	
	
		('*//&begin*(*' match: l) ifTrue: [ stack addLast: index ].
		('*// &begin*(*' match: l) ifTrue: [ stack addLast: index ].
		('*//&begin*[*' match: l) ifTrue: [ stack addLast: index ].
		('*// &begin*[*' match: l) ifTrue: [ stack addLast: index ].
		((('*//&end*(*' match: l) or: [ ('*// &end*(*' match: l) ]) or: [ (('*//&end*[*' match: l) or: [ ('*// &end*[*' match: l) ]) ])
			ifTrue: [ 
				
				b := stack removeLast.
				stream nextPutAll: unit filename.
				stream nextPut: $,.
				stream nextPutAll: b asString.
				stream nextPut: $-.
				stream nextPutAll: index asString.
				stream nextPut: $,.
				stream nextPutAll: ((l substrings: '&') last substrings: '()[]') last.
				stream nextPutAll: ',FRAGMENT'.
				stream cr.
				].
	]
]

{ #category : #'public - features' }
SAJModel >> getFeatureListFromSourceCodeUsingArgoUmlSPL [
	"INPUT = ARGO UML SPL"
	"Produce a CSV file something like:
'fileName,lineRange,featureName,annotationGranualarity
Canvas.java,2-3,Feature1,FRAGMENT
Canvas.java,6-7,Feature2,FRAGMENT
Shape.java,6-7,Feature1,FRAGMENT
Shape.java,6-7,Feature3,FRAGMENT
Shape.java,6-7,Feature4,FRAGMENT
'
"
	| w |
	w := WriteStream on: String new.
	self units do: [ :u |
		[self getFeatureListFromSourceCodeUsingArgoUmlSPLFor: u in: w] on: Error do: [  ]
		 ].
	^ w contents
]

{ #category : #private }
SAJModel >> getFeatureListFromSourceCodeUsingArgoUmlSPLFor: unit in: stream [	

	| stack b featureName |
	stack := OrderedCollection new.
	unit sourceCode lines doWithIndex: [ :l :index |
		('*#if defined(*' match: l) ifTrue: [
			featureName := (l trimBoth substrings: '()') last.
			"Halt if: [ featureName size < 4 ]. "
			stack addLast: { index . featureName } ].
		('*#endif*' match: l) ifTrue: [ 
			b := stack removeLast.
			stream nextPutAll: unit filename.
			stream nextPut: $,.
			stream nextPutAll: b first asString.
			stream nextPut: $-.
			stream nextPutAll: index asString.
			stream nextPut: $,.
			stream nextPutAll: b second.
			stream nextPutAll: ',FRAGMENT'.
			stream cr.
			].
	]
]

{ #category : #accessing }
SAJModel >> getOrCreateClassNamed: aClassName [

	| cls |
	^ self classNamed: aClassName ifNone: [ 
		cls := SAJClass new name: aClassName. 
		cls makeStub.
		units add: cls.
		cls ]
]

{ #category : #'public - features' }
SAJModel >> getOrCreateFeatureNamed: aName [
	"Return a SAJFeature or create one if it does not exist"
	| doesExist |
	doesExist := features anySatisfy: [ :f | f featureName = aName ].
	doesExist ifFalse: [ features add: (SAJFeature new featureName: aName; model: self) ].
	^ features detect: [ :f | f featureName = aName ].
]

{ #category : #'visualization - not interesting' }
SAJModel >> gtInspectorFeatureInteractionIn: composite [
	<gtInspectorPresentationOrder: -90>
	composite roassal3
		title: 'Feat. Int.';
		initializeCanvas: [ self visualizeFeatureInteraction ]
]

{ #category : #'visualization - not interesting' }
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

{ #category : #'visualization - not interesting' }
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

	"Expect an input such as:
'fileName,lineRange,featureName,annotationGranualarity
Canvas.java,2-3,Feature1,FRAGMENT
Canvas.java,6-7,Feature2,FRAGMENT
Shape.java,6-7,Feature1,FRAGMENT
Shape.java,6-7,Feature3,FRAGMENT
Shape.java,6-7,Feature4,FRAGMENT
'
"
	| lines ss unitName from to featureName annotationGranularity feat annotation unit |
	lines := csvAsString lines allButFirst.
	lines do: [ :l |
		ss := l substrings: ','.
		unitName := (ss first substrings: '\/.') allButLast last.
		from := (ss second substrings: '-') first asInteger.
		
		"to cannot be inferior than from"
		to := (ss second substrings: '-') second asInteger max: from.
		featureName := ss third.
		annotationGranularity := ss fourth.
		
		feat := self getOrCreateFeatureNamed: featureName.
		unit := self unitNamed: unitName ifNone: [ nil ].
		
		annotation := SAJFeatureAnnotations new.
		annotation annotationGranularity: annotationGranularity.
		annotation from: from.
		annotation to: to - 1.
		annotation unit: unit.
		unit ifNotNil: [ 
			unit addAnnotation: annotation.
			annotation feature: feat.
			feat addAnnotation: annotation  ] "ifNil: [ self halt ]".
	] 
]

{ #category : #'public - features' }
SAJModel >> importFeaturesHierarchy: string [

	"Expect an input such as:
'BitcoinWallet
    BitCoins
        Denomination
            BTC8dp'
"

	| lines numberOfSpaces stack level currentFeature |
	numberOfSpaces := '    ' size.
	lines := string lines.
	stack := OrderedCollection new.

	lines do: [ :l | 
		level := (l select: [ :c | c = $  ]) size / numberOfSpaces + 1.
		currentFeature := self getOrCreateFeatureNamed: l trimLeft.

		level = 1
			ifTrue: [ stack addLast: currentFeature ]
			ifFalse: [ 
				level < stack size ifTrue: [ stack := stack first: level ].
				level = stack size ifTrue: [ stack := stack allButLast ].
				currentFeature parent: stack last.
				stack last addChild: currentFeature.
				stack addLast: currentFeature ] ]
]

{ #category : #initialization }
SAJModel >> initialize [
	super initialize.
	units := OrderedCollection new.
	features := OrderedCollection new.
	packages := OrderedCollection new
]

{ #category : #visualization }
SAJModel >> inspectorCanvas [
	<inspectorPresentationOrder: 70 title: 'Feat Inter'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeFeatureInteraction;
		yourself
]

{ #category : #visualization }
SAJModel >> inspectorCanvasContext: aContext [
  
  aContext withoutEvaluator
]

{ #category : #visualization }
SAJModel >> inspectorFeatureColor [
	<inspectorPresentationOrder: 80 title: 'FeatureColor'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeFeatureColor;
		yourself
]

{ #category : #visualization }
SAJModel >> inspectorFeatureColorContext: aContext [
  
  aContext withoutEvaluator
]

{ #category : #visualization }
SAJModel >> inspectorHierarchy [
	<inspectorPresentationOrder: 80 title: 'Hierarchy'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeFeatureInteractionHierarchy;
		yourself
]

{ #category : #visualization }
SAJModel >> inspectorHierarchyContext: aContext [
  
  aContext withoutEvaluator
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
SAJModel >> resolveImports [
	"This is a private method"
	self units do: [ :u |
		u imports do: [ :i |
			i toUnit: (self unitNamed: i getClassName ifNone: [ nil ]).
			i toUnit ifNotNil: [ 
				i toUnit addIncomingUnit: i fromUnit.
				i fromUnit addOutgoingUnit: i toUnit
				 ]
			 ]
	]
]

{ #category : #private }
SAJModel >> resolveSuperclasses [
	"This is a private method"
	self classes do: [ :cls |
		cls superclassName ifNotNil: [ 
			cls superclass: (self getOrCreateClassNamed: cls superclassName) ]  ]
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

{ #category : #'visualization - not interesting' }
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
SAJModel >> visualizeFeatureColor [
	| m |
	m := RSMondrian new.
	m shape box color: #color.
	m nodes: self features.
	m orthoVerticalLine connectFrom: #parent.
	m normalizeSize: #numberOfAnnotations.
	m layout tree.
	m build.

	^ m canvas
]

{ #category : #visualization }
SAJModel >> visualizeFeatureInteraction [

	| c lb |
	c := RSCanvas new.
	self visualizeFeatureInteractionIn: c.

	lb := RSLegend new.
	lb container: c.
	lb withFrame.
	lb onDemand: 'Legend'.
	lb title: 'Feature interaction'.
	lb text: 'Large light-gray boxes: Java package'.
	lb text: 'Smaller dark-gray boxes: Java classes'.
	lb text: 'Link between Java classes: inheritance (superclass is above its subclasses)'.
	lb text: '  '.
	lb text: 'Left: feature model'.
	lb text: 'Right: package and its classes'.
	lb text: 'Class size: number of lines of code'.
	lb build.
	

	c @ RSCanvasController.
	^ c
]

{ #category : #visualization }
SAJModel >> visualizeFeatureInteractionHierarchy [
	| c lb |
	c := RSCanvas new.
	self visualizeFeatureInteractionHierarchyIn: c.
	
	lb := RSLegend new.
	lb container: c.
	lb withFrame.
	lb onDemand: 'Legend'.
	lb title: 'Feature interaction'.
	lb text: 'Dark-gray boxes: Java classes'.
	lb text: 'Link between Java classes: inheritance (superclass is above its subclasses)'.
	lb text: '  '.
	lb text: 'Left: feature model'.
	lb text: 'Right: Java classes'.
	lb text: 'Class size: number of lines of code'.
	lb build.
	
	c @ RSCanvasController.
	^ c
]

{ #category : #visualization }
SAJModel >> visualizeFeatureInteractionHierarchyIn: c [
	| m featureLabels channel eb allClasses |
	"packages and classes"
	m := RSMondrian new.
	m canvas: c.
	m shape box size: [ :cc | cc loc sqrt * 2 + 5 ].
	m nodes: self classes.
	m orthoVerticalLine connectFrom: #superclass.
	m layout ifConnected: RSTreeLayout new ifNotConnected: (RSFlowLayout new gapSize: 20).
	m build.
	
	"RSClusteringLayout new 
	    clustersLayout: RSFlowLayout new;
	    forEachLayout: RSTreeLayout new;
		on: m canvas nodes. "
	RSConditionalLayout new
	 ifNotConnectedThen: RSGridLayout new;
	 else: (RSClusteringLayout new 
	    clustersLayout: RSFlowLayout new;
	    forEachLayout: RSTreeLayout new);
	 on: m canvas nodes.

	
"	interaction := RSHighlightable 
    						showEdges: #outgoingUnits 
    						using: RSLine new.
	(m canvas deepShapesFromModels: self units) do: [ :u | u @ interaction ].
"	
	
	
	allClasses := c shapesFromModels: self classes copy.

	"Features"
	featureLabels := (self features sortedAs: #name) collect: [ :f | RSLabel new text: f name; model: f ] as: RSGroup.
	RSNormalizer fontSize
		shapes: featureLabels;
		from: 10; to: 20;
		normalize: #numberOfUnits.
	
	eb := RSEdgeBuilder orthoHorizontal.
	eb withHorizontalAttachPoint.
	eb canvas: c.
	eb shapes: featureLabels.
	eb connectFrom: #parent.
	
	"RSFlowLayout new maxWidth: 700; on: featureLabels."
	RSHorizontalTreeLayout new on: featureLabels.
	
	c addAll: featureLabels.
	RSHorizontalLineLayout new gapSize: 40; alignMiddle; on: { featureLabels . allClasses }.
	featureLabels do: [ :aFeatLabel |
		channel := RSChannel new.
		channel markGoUp.
		channel color: aFeatLabel model color.
		channel input: { aFeatLabel } asGroup.
		channel output: (c deepShapesFromModels: aFeatLabel model units).
		channel build.
		
		channel := RSChannel new.
		channel makeNotClickable.
		channel color: aFeatLabel model color.
		channel input: (c deepShapesFromModels: aFeatLabel model units).
		channel output: { aFeatLabel } asGroup.
		channel build.
	].

	"We remove all the label to prevent the inspector from opening"
	"featureLabels do: [ :l | l model: nil ]"
	
"	(c deepShapesFromModels: self units) when: RSMouseClick do: [ :evt |
		evt shape model visualizeButterfly  openWithTitle: evt shape model name.
	].
"
]

{ #category : #visualization }
SAJModel >> visualizeFeatureInteractionIn: c [
	| m allPackages featureLabels channel eb |
	"packages and classes"
	m := RSMondrian new.
	m canvas: c.
	m shape box color: Color gray lighter lighter lighter.
	m nodes: self packages forEach: [ :pak |
		m shape box size: [ :cc | cc loc sqrt * 2 + 5].
		m nodes: pak classes.
		m orthoVerticalLine connectFrom: #superclass.
		m layout ifConnected: RSTreeLayout new ifNotConnected: (RSFlowLayout new gapSize: 20).
	].
	m layout flow gapSize: 30"; maxWidth: 2000".
	m build.
	
	
"	interaction := RSHighlightable 
    						showEdges: #outgoingUnits 
    						using: RSLine new.
	(m canvas deepShapesFromModels: self units) do: [ :u | u @ interaction ].
"	
	
	
	allPackages := c shapesFromModels: self packages copy.
	allPackages @ (RSLabeled new text: [ :pak | pak name ]).

	"Features"
	featureLabels := (self features sortedAs: #name) collect: [ :f | RSLabel new text: f name; model: f ] as: RSGroup.
	RSNormalizer fontSize
		shapes: featureLabels;
		from: 10; to: 20;
		normalize: #numberOfUnits.
	
	eb := RSEdgeBuilder orthoHorizontal.
	eb withHorizontalAttachPoint.
	eb canvas: c.
	eb shapes: featureLabels.
	eb connectFrom: #parent.
	
	"RSFlowLayout new maxWidth: 700; on: featureLabels."
	RSHorizontalTreeLayout new on: featureLabels.
	
	c addAll: featureLabels.
	RSHorizontalLineLayout new gapSize: 40; alignMiddle; on: { featureLabels . allPackages }.
	featureLabels do: [ :aFeatLabel |
		channel := RSChannel new.
		channel markGoUp.
		channel color: aFeatLabel model color.
		channel input: { aFeatLabel } asGroup.
		channel output: (c deepShapesFromModels: aFeatLabel model units).
		channel toggleOnCallback: [ :aShape | aFeatLabel model makeAsSelected ].
		channel toggleOffCallback: [ :aShape | aFeatLabel model makeAsUnselected ].
		channel build.
		
		channel := RSChannel new.
		channel makeNotClickable.
		channel color: aFeatLabel model color.
		channel input: (c deepShapesFromModels: aFeatLabel model units).
		channel output: { aFeatLabel } asGroup.
		channel build.
	].

	"We remove all the label to prevent the inspector from opening"
	"featureLabels do: [ :l | l model: nil ]"
	
"	(c deepShapesFromModels: self units) when: RSMouseClick do: [ :evt |
		evt shape model visualizeButterfly  openWithTitle: evt shape model name.
	].
"
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
