Class {
	#name : #REGModel,
	#superclass : #Object,
	#instVars : [
		'modules',
		'headers',
		'layers',
		'rootFilename'
	],
	#category : #'SoftwareAnalyzer-CPP'
}

{ #category : #public }
REGModel >> addSrcMLXML: xml [
	"xml as string. Return the units contained in the files. Return the REG modules that are created
	
	Generating in a very simple way:
	srcml *.{c,h} -o example.xml
	

	When folder may contain source code files
	find . -type f \( -iname \*.c -o -iname \*.cpp -o -iname \*.h -o -iname \*.hpp \) -exec srcml {} -o {}.xml \;
	mkdir xml
	find . -name ""*.xml"" -exec mv {} xml \;
	"
	| units |
	self assert: [ xml isByteString ] description: 'Wrong type'.
	units := (XMLDOMParser parse: xml) document
		descendantNodesSelect: [ :x | ( ({ XMLPI . XMLString } includes: x class) not) and: [ x name = 'unit' and: [ x attributes includesKey: 'filename' ] ] ].
		
	^ units collect: [ :u | self addUnitAsXML: u ].
	
]

{ #category : #'private - XML' }
REGModel >> addUnitAsXML: xml [
	"Add a unit described using XML, and return a module"
	| m isModule |
	self assert: [ xml class name beginsWith: 'XML' ] description: 'Wrong type'.
	isModule := #('.C' '.c' '.cpp' '.CPP') anySatisfy: [ :p | (xml attributeAt: 'filename') endsWith: p ].
	 
	m := isModule ifTrue: [ REGModule new ] ifFalse: [ REGHeader new ].
	m filename: (xml attributeAt: 'filename').

	(xml allElementsSelect: [ :x | x name = 'class' ]) do: [ :iXML |
		m addClass: (self createClassFromXML: iXML) ].
	
	(xml allElementsSelect: [ :x | x name = 'cpp:include' ]) do: [ :iXML |
		m addInclude: (self createIncludeFromXML: iXML) ].
	
	m metrics at: #LOC put: xml rawString lines size.

	(xml allElementsSelect: [ :x | x name = 'function' ]) do: [ :fXML |
		m addFunction: (self createFunctionFromXML: fXML) ].
	
	(#('.C' '.c' '.cpp' '.CPP') anySatisfy: [ :p | m filename endsWith: p ])
		ifTrue: [ modules add: m ]
		ifFalse: [ headers add: m ].
	m model: self.
	^ m
	
]

{ #category : #'public - metrics' }
REGModel >> allFunctions [
	modules ifEmpty: [ ^ #() ].
	^ modules flatCollect: #functions
]

{ #category : #accessing }
REGModel >> allIncludes [
	^ self modules, self headers flatCollect: #includes
]

{ #category : #public }
REGModel >> buildArchitecture [
	| layerName l |
	self units do: [ :u |
		layerName := (u filename substrings: '/') first.
		l := self getAndCreateIfNecessaryLayerNamed: layerName.
		l addUnit: u.
		u layer: l.
	]
		
]

{ #category : #public }
REGModel >> buildCallGraph [
	| dict |
	dict := self allFunctions groupedBy: #basename.
	self allFunctions do: [ :f | 
		f callingFunctionNames do: [ :n |
			(dict includesKey: n)
				ifTrue: [ f addOutgoingFunctions: (dict at: n) ] ] ].
	
	self allFunctions do: [ :f | f outgoingFunctions do: [ :f2 | f2 addIncomingFunction: f ] ]
]

{ #category : #public }
REGModel >> buildFeatures [
	| allNames allFeatureAnnotations dictionary featureAnnotationStack |
	allNames := OrderedCollection new.
	allFeatureAnnotations := OrderedCollection new.
	featureAnnotationStack := OrderedCollection new.
	self units do: [ :unit |
		unit sourceCode lines doWithIndex: [ :l :index |
			(l trimLeft beginsWith: '#if')
				ifTrue: [ 
					| a |
					a := REGFeatureAnnotation new. 
					a name: l substrings second. 
					a startLine: index.
					a unit: unit.
					allNames add: a name.
					allFeatureAnnotations add: a.
					featureAnnotationStack ifNotEmpty: [ 
						featureAnnotationStack last addChildrenAnnotation: a.
						a parentAnnotation: featureAnnotationStack last. ].
					featureAnnotationStack add: a ].
				
			(l trimLeft beginsWith: '#endif')
				ifTrue: [ 
					featureAnnotationStack last endLine: index.
					unit addFeatureAnnotation: featureAnnotationStack last.
					featureAnnotationStack removeLast  ]
			 ]
	].

	"We build the features themselves, from the names found in the annotations"
	dictionary := Dictionary new.
	allNames do: [ :aName |
		dictionary at: aName put: (REGFeature new name: aName) ].
	
	allFeatureAnnotations do: [ :aa |
		| f |
		f := dictionary at: aa name.
		aa feature: f.
		f addAnnotation: aa
		 ]
	
	

	
]

{ #category : #public }
REGModel >> buildFileDependencies [

	| d |
	d := Dictionary new.
	modules, headers do: [ :unit | 
		d at: unit basename put: unit ].
	
	modules, headers do: [ :unit | 
		unit includes do: [ :i |
			
			i fromUnit: unit.
			(d includesKey: i basename) ifTrue: [ i toUnit: (d at: i basename) ]
		]
	].


]

{ #category : #'private - XML' }
REGModel >> createClassFromXML: xml [
	| c nameXML fullname |
	c := REGClass new.
	nameXML := xml elementAt: 'name'.
	fullname := '' join: ((nameXML allNodes select: [ :x | x class == XMLString ]) collect: #asString).
	c name: fullname.
	^ c
	
]

{ #category : #'private - XML' }
REGModel >> createFunctionFromXML: xml [
	| f nameXML fullNameString calls callNames relevantCallNames namesToConsider |
	nameXML := xml elementAt: 'name'.
	fullNameString := '' join: ((nameXML allNodes select: [ :x | x class == XMLString ]) collect: #asString).
	f := REGFunction new.
	f name: fullNameString.
	f numberOfLinesOfCode: xml asString lines size.
	
	"Getting calls"
	calls := xml searchFor: 'call'.
	"callNames := calls collect: [ :c | c @ { 'name' } ]."
	callNames := calls flatCollect: [ :c | c searchFor: 'name' ].
	"If we have C++, then callNames contains 'name' again"
	relevantCallNames := callNames copyWithout: nil.
	namesToConsider := relevantCallNames collect: [ :n | n getString ].
	"Very hacky, sorry"
	namesToConsider := namesToConsider reject: [ :n | n beginsWith: '<name' ].
	f callingFunctionNames: namesToConsider.
	
	"Getting source code"
	f sourceCode: xml rawString.
	
	^ f
]

{ #category : #'private - XML' }
REGModel >> createIncludeFromXML: xml [
	| i |
	i := REGImport new.
	i name: (xml findElementNamed: 'cpp:file') nodes first string.
	^ i
]

{ #category : #examples }
REGModel >> exampleFPrime [
	<script: 'self new exampleFPrime inspect'>

	| fprimePath m |
	fprimePath := '/Users/alexandrebergel/Dropbox/Workspace/NASA/fprime/xml'.
	
	m := REGModel new.
	
	"Say where to get the application source code"
	m rootFilename: '/Users/alexandrebergel/Dropbox/Workspace/NASA/fprime'.
	fprimePath asFileReference children do: [ :c |
		[ m addSrcMLXML: c readStream contents ] on: ZnInvalidUTF8 do: [ :ex |  ].
	].
	m buildFileDependencies.
	m buildArchitecture.
	m buildCallGraph.
	^ m
]

{ #category : #examples }
REGModel >> exampleSmall [
	<script: 'self new exampleSmall inspect'>

	| m |
	m := REGModel new.
	m addSrcMLXML: REGModelTest new codeExample.
	m buildFileDependencies.
	m buildArchitecture.
	^ m
]

{ #category : #examples }
REGModel >> exampleSuchai [
	<script: 'self new exampleSuchai inspect'>

	| fprimePath m |
	fprimePath := '/Users/alexandrebergel/Dropbox/Workspace/suchai-flight-software/xml'.
	
	m := REGModel new.
	
	"Say where to get the application source code"
	m rootFilename: '/Users/alexandrebergel/Dropbox/Workspace/suchai-flight-software'.
	fprimePath asFileReference children do: [ :c |
		[ m addSrcMLXML: c readStream contents ] on: ZnInvalidUTF8 do: [ :ex |  ].
	].
	m buildFileDependencies.
	m buildArchitecture.
	m buildCallGraph.
	m buildFeatures.
	^ m
]

{ #category : #examples }
REGModel >> exampleUVent [
	<script: 'self new exampleUVent inspect'>

	| uventPath m |
	uventPath := '/Users/alexandrebergel/Dropbox/GitRepos/u-vent/example.xml'.
	
	m := REGModel new.
	m addSrcMLXML: uventPath asFileReference contents.
	m buildFileDependencies.
	m buildArchitecture.
	^ m
]

{ #category : #accessing }
REGModel >> featureAnnotations [
	^ self units flatCollect: #featureAnnotations
]

{ #category : #accessing }
REGModel >> features [
	"Return all the feature of the units"
	^ (self units flatCollect: #features) copyWithoutDuplicates
]

{ #category : #accessing }
REGModel >> getAndCreateIfNecessaryLayerNamed: aName [
	| l |
	l := layers detect: [ :ll | ll name = aName ] ifNone: [ nil ].
	l ifNil: [ 
		l := REGLayer new name: aName.
		layers add: l
		 ].
	^ l
]

{ #category : #visualization }
REGModel >> gtInspectorFunctionDependenciesn: composite [
	<gtInspectorPresentationOrder: -5>
	composite roassal3
		title: 'FunctionDep';
		initializeCanvas: [ self visualizeFunctionDependencies ]
]

{ #category : #visualization }
REGModel >> gtInspectorLayersIn: composite [
	<gtInspectorPresentationOrder: -25>
	composite roassal3
		title: 'Layers';
		initializeCanvas: [ self visualizeLayers ]
]

{ #category : #visualization }
REGModel >> gtInspectorMissingIncludesIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'Missing Includes';
		display: [ self missingIncludeFiles ]
]

{ #category : #visualization }
REGModel >> gtInspectorModulesIn: composite [
	<gtInspectorPresentationOrder: -20>
	composite roassal3
		title: 'Modules';
		initializeCanvas: [ self visualizeModules ]
]

{ #category : #accessing }
REGModel >> headers [
	^ headers
]

{ #category : #initialization }
REGModel >> initialize [
	super initialize.
	modules := OrderedCollection new.
	headers := OrderedCollection new.
	layers := OrderedCollection new
]

{ #category : #visualization }
REGModel >> inspectorFunctionDependencies [
	<inspectorPresentationOrder: 90 title: 'Function dependencies'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeFunctionDependencies;
		yourself
]

{ #category : #visualization }
REGModel >> inspectorVisualization [
	<inspectorPresentationOrder: 90 title: 'Canvas'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualize;
		yourself
]

{ #category : #accessing }
REGModel >> layers [
	^ layers
]

{ #category : #accessing }
REGModel >> missingIncludeFiles [

	| unresolvedIncludes names |
	unresolvedIncludes := self allIncludes select: [ :i | i toUnit isNil ].
	names := (unresolvedIncludes collect: #rawName as: Set) asSortedCollection.
	^ ', ' join: names
]

{ #category : #accessing }
REGModel >> modules [
	^ modules
]

{ #category : #'public - metrics' }
REGModel >> numberOfClasses [
	modules ifEmpty: [ ^ 0 ].
	^ (modules collect: #numberOfClasses) sum
]

{ #category : #'public - metrics' }
REGModel >> numberOfFeatureAnnotations [
	self units ifEmpty: [ ^ 0 ].
	^ (self units collect: #numberOfFeatureAnnotations) sum
]

{ #category : #'public - metrics' }
REGModel >> numberOfFeatures [
	"Return the number of features founds in the model"
	^ self features size
]

{ #category : #'public - metrics' }
REGModel >> numberOfFunctions [
	modules ifEmpty: [ ^ 0 ].
	^ (modules collect: #numberOfFunctions) sum
]

{ #category : #'public - metrics' }
REGModel >> numberOfHeaders [
	^ headers size
]

{ #category : #'public - metrics' }
REGModel >> numberOfLayers [
	^ layers size
]

{ #category : #'public - metrics' }
REGModel >> numberOfLinesOfCode [
	| units |
	units := self modules, self headers.
	units ifEmpty: [ ^ self ].
	^ (units collect: #numberOfLinesOfCode) sum
]

{ #category : #'public - metrics' }
REGModel >> numberOfModules [
	^ modules size
]

{ #category : #'public - metrics' }
REGModel >> numberOfUnits [
	^ self numberOfModules + self numberOfHeaders
]

{ #category : #accessing }
REGModel >> rootFilename [
	^ rootFilename
]

{ #category : #accessing }
REGModel >> rootFilename: aString [
	"Set the root of the folder that contains the application source code"
	rootFilename := aString
]

{ #category : #accessing }
REGModel >> units [
	^ self modules, self headers
]

{ #category : #visualization }
REGModel >> visualize [

	| c units eb |
	c := RSCanvas new.
	
	units := RSGroup new.
	self modules do: [ :m |
		units add: (RSBox new model: m).
	].

	self headers do: [ :m |
		units add: (RSBox new model: m; color: Color pink lighter lighter lighter).
	].

	RSNormalizer size
		shapes: units;
		from: 10; to: 50;
		normalize: #numberOfLinesOfCode.

	eb := RSEdgeBuilder arrowedLineWithOffset: 0.2.
	eb canvas: c.
	eb shapes: units.
	eb connectToAll: #outgoingUnits.

	"units @ (RSLabeled new text: [ :m | m filename ]; highlightable) @ RSDraggable."
	units @ (RSLabeled new text: [ :m | m filename ]) @ RSDraggable.
	units @ (RSHighlightable new withEdges; highlightColor: Color red).
	c addAll: units.
	
	"RSGridLayout on: units."
	RSForceBasedLayout new charge: -800; on: units.
	c @ RSCanvasController.
	^ c
]

{ #category : #visualization }
REGModel >> visualizeFunctionDependencies [

	| m |
	m := RSMondrian new.
	m shape circle color: Color blue darker.
	m nodes: self allFunctions.
	m line connectToAll: #outgoingFunctions.
	m normalizeSize: #numberOfLinesOfCode.
	m layout force.
	m build.
	^ m canvas
]

{ #category : #visualization }
REGModel >> visualizeLayers [

	| c g ls layerShapes ll lb maxDep color |
	c := RSCanvas new.
	
	maxDep := (modules detectMax: #numberOfIncludes) numberOfIncludes.
	color := NSScale linear
					range: { Color gray . Color red };
					domain: { 0 . maxDep }. 
	layerShapes := layers collect: [ :l |
		g := RSGroup new.
		l modules do: [ :u |
			g add: (RSBox new color: (color scale: u numberOfIncludes); model: u; height: u numberOfLinesOfCode / 5 + 5; width: u numberOfFunctions * 3 + 5).
		 ].
		g @ RSPopup.
		RSGridLayout on: g.
		ls := g asShapeFor: l.
		ls @ RSPopup @ RSDraggable.
		ls adjustToChildren.
		ls padding: 5.
		ls color: Color lightGray.
		
		c add: ls.
		
		ll := RSLabeled new.
		ll fontSize: 40.
		ll text: #name.
		ls @ ll.
		ls
	].
	"RSRectanglePackLayout"
	RSEquidistantCircleLayout new initialRadius: 900; on: layerShapes.
	
	RSEdgeBuilder bimetricLine
		canvas: c;
		noBidirectional;
		objects: layers;
		noBorder;
		widthFrom:[ :edge | (edge key numberOfOutgoingUnitsToward: edge value) sqrt * 4 ];
		widthTo:[ :edge | (edge value numberOfOutgoingUnitsToward: edge key) sqrt * 4 ];
		paint: Color blue translucent;
		withBorderAttachPoint;
		connectFrom: #yourself toAll: #outgoingLayers.
	
	
	lb := RSLegend new.
	lb onDemand: 'Legend'.
	lb container: c.
	lb text: 'Visualizing the source code distribution over modules'.
	lb polymetricWidth: '#Functions' height: '#Lines of code' box: '#Dependencies'.
	lb build.
	
	^ c @ RSCanvasController
]

{ #category : #visualization }
REGModel >> visualizeModules [

	| c units eb |
	c := RSCanvas new.
	
	units := RSGroup new.
	self modules do: [ :m |
		units add: (RSEllipse new model: m).
	].

	self headers do: [ :m |
		units add: (RSEllipse new model: m; color: Color red lighter lighter).
	].

	RSNormalizer size
		shapes: units;
		from: 10; to: 50;
		normalize: #numberOfLinesOfCode.

	eb := RSEdgeBuilder arrowedLineWithOffset: 0.2.
	eb canvas: c.
	eb shapes: units.
	eb connectToAll: #outgoingUnits.

	"units @ (RSLabeled new text: [ :m | m filename ]; highlightable) @ RSDraggable."
	units "@ (RSLabeled new text: [ :m | m filename ]) "@ RSDraggable.
	units @ (RSHighlightable new withEdges; highlightColor: Color red).
	c addAll: units.
	
	"RSGridLayout on: units."
	RSForceBasedLayout new charge: -800; on: units.
	c @ RSCanvasController.
	^ c
]
