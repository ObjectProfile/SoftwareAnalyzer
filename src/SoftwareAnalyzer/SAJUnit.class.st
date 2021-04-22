Class {
	#name : #SAJUnit,
	#superclass : #SAJStructuralElement,
	#instVars : [
		'methods',
		'loc',
		'annotations',
		'package',
		'packageName',
		'filename',
		'imports',
		'outgoingUnits',
		'incomingUnits',
		'isStub'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #adding }
SAJUnit >> addAnnotation: ann [
	annotations add: ann
]

{ #category : #adding }
SAJUnit >> addImport: anImport [
	imports add: anImport 
]

{ #category : #adding }
SAJUnit >> addIncomingUnit: aUnit [
	incomingUnits add: aUnit
]

{ #category : #adding }
SAJUnit >> addOutgoingUnit: aUnit [
	outgoingUnits add: aUnit
]

{ #category : #accessing }
SAJUnit >> annotations [
	^ annotations
]

{ #category : #private }
SAJUnit >> buildAnnotationHierarchy [
	"Build the hierarchy of the annotation. Compute the parent annotation for each parent.
	This method assumes that each annotation has one parent at most."
	| sortedAnnotations parentsStack runningParent rootAnn |
	"self assert: [ self annotations allSatisfy: [ :a | a parentAnnotation isNil ] ]."
	
	"We sort the annotations based on the begining of the annotation (from field, the line of code)"
	sortedAnnotations := self annotations sortedAs: #from.
	
	parentsStack := OrderedCollection new.
	rootAnn := SAJFeatureAnnotations new from: 1; to: self numberOfLinesOfCode.
	parentsStack add: rootAnn.
	
	sortedAnnotations do: [ :a |
		runningParent := parentsStack last.
		(runningParent from <= a from and: [ runningParent to >= a to ])
			ifTrue: [ a parentAnnotation: runningParent. parentsStack add: a ]
			ifFalse: [ parentsStack removeLast. parentsStack ifEmpty: [ parentsStack add: rootAnn ] ].
	]

]

{ #category : #accessing }
SAJUnit >> features [
	^ (annotations collect: #feature as: Set) asSortedCollection: [ :f1 :f2 | f1 featureName < f2 featureName ]
]

{ #category : #accessing }
SAJUnit >> filename [
	^ filename
]

{ #category : #accessing }
SAJUnit >> filename: anObject [
	filename := anObject
]

{ #category : #'TO REMOVE' }
SAJUnit >> gtInspectorSourceCodeIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'Source';
		display: #sourceCode
]

{ #category : #'TO REMOVE' }
SAJUnit >> gtInspectorVisualizeIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Visualize';
		initializeCanvas: [ self visualize ]
]

{ #category : #accessing }
SAJUnit >> imports [
	^ imports
]

{ #category : #accessing }
SAJUnit >> incomingUnits [
	^ incomingUnits
]

{ #category : #initialization }
SAJUnit >> initialize [
	super initialize.
	annotations := OrderedCollection new.
	packageName := 'default'.
	imports := OrderedCollection new.
	outgoingUnits := OrderedCollection new.
	incomingUnits := OrderedCollection new.
	isStub := false.
	self loc: 0
]

{ #category : #visualization }
SAJUnit >> inspectSourceCode [
	^ self sourceCode inspect
]

{ #category : #visualization }
SAJUnit >> inspectorAnnotationTree [
	<inspectorPresentationOrder: 300 title: 'TreeAnnotation'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeAnnotationTree;
		yourself
]

{ #category : #visualization }
SAJUnit >> inspectorAnnotationTreeContext: aContext [
  
  aContext withoutEvaluator
]

{ #category : #visualization }
SAJUnit >> inspectorCanvas [
	<inspectorPresentationOrder: 90 title: 'Dependencies'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeButterfly;
		yourself
]

{ #category : #visualization }
SAJUnit >> inspectorCanvasContext: aContext [
  
  aContext withoutEvaluator
]

{ #category : #visualization }
SAJUnit >> inspectorSourceCode [
	<inspectorPresentationOrder: 90 title: 'SourceCode'>
	^ SpTextPresenter new
		text: self sourceCode;
		yourself.
	

]

{ #category : #visualization }
SAJUnit >> inspectorSourceCodeContext: aContext [
  
  aContext withoutEvaluator
	

]

{ #category : #testing }
SAJUnit >> isClass [
	^ false
]

{ #category : #testing }
SAJUnit >> isEnum [
	^ false
]

{ #category : #testing }
SAJUnit >> isInterface [
	^ false
]

{ #category : #accessing }
SAJUnit >> isNotStub [
	^ self isStub not
]

{ #category : #accessing }
SAJUnit >> isStub [
	"Return true if the class is not defined in the model"
	^ isStub
]

{ #category : #accessing }
SAJUnit >> loc [
	^ loc
]

{ #category : #accessing }
SAJUnit >> loc: anInteger [
	loc := anInteger
]

{ #category : #accessing }
SAJUnit >> makeStub [
	isStub := true
]

{ #category : #accessing }
SAJUnit >> methods [
	^ methods
]

{ #category : #accessing }
SAJUnit >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
SAJUnit >> name: anObject [
	name := anObject
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfAnnotations [
	^ (self features flatCollect: #annotations) size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfFeatures [
	^ self features size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfImports [
	^ imports size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfIncomingUnits [
	^ incomingUnits size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfLinesOfCode [
	^ self sourceCode lines size
]

{ #category : #'public - metrics' }
SAJUnit >> numberOfOutgoingUnits [
	^ outgoingUnits size
]

{ #category : #accessing }
SAJUnit >> outgoingUnits [
	^ outgoingUnits
]

{ #category : #accessing }
SAJUnit >> package [
	^ package
]

{ #category : #accessing }
SAJUnit >> package: aPackage [
	package := aPackage
]

{ #category : #accessing }
SAJUnit >> packageName [
	^ packageName
]

{ #category : #accessing }
SAJUnit >> packageName: aString [
	self assert: [ aString isByteString ].
	self assert: [ (aString includes: $<) not ].
	packageName := aString
]

{ #category : #printing }
SAJUnit >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: self name.
	str nextPutAll: ', Fan-out: '.
	str nextPutAll: self numberOfOutgoingUnits asString.
	str nextPutAll: ', Fan-in: '.
	str nextPutAll: self numberOfIncomingUnits asString.
	str nextPut: $>.
]

{ #category : #accessing }
SAJUnit >> sourceCode [
	| fr |
	self isStub ifTrue: [ 
		^ 'This compilation unit is a stub, which is a class that is referenced by the code, but not defined in it. As such, no definition is attached to it.'
	].

	((self model isNil or: [ self model rootFilename isNil ]) or: [ self model rootFilename isEmpty ])
		ifTrue: [ ^ '' ].
	
	fr := (self model rootFilename, '/', self filename) asFileReference.
	fr exists ifFalse: [ ^ '' ].
	^ fr contents
]

{ #category : #visualization }
SAJUnit >> visualizeAnnotationTree [

	| m lb |
	m := RSMondrian new.
	m shape box 
		if: [ :anno | anno feature isSelected ] color: [ :anno | anno feature color ].
	m nodes: self annotations.
	m line connectFrom: #parentAnnotation.
	m normalizeSize: #numberOfLinesOfCode.
	m layout tree.
	m build.
	
	lb := RSLegend new.
	lb container: m canvas.
	lb withFrame.
	lb onDemand: 'Legend'.
	lb title: 'Visualizing the feature annotation tree'.
	lb text: 'A class may contain annotations. A feature annotation may have a parent annotation'.
	lb text: 'This visualization shows the annotations, formed as a tree'.
	lb text: 'Box: annotation'.
	lb text: 'Box size: size in lines of code of the represented annotation'.
	lb build.
	
	^ m canvas
]

{ #category : #visualization }
SAJUnit >> visualizeButterfly [
	| c lb |
	c := RSCanvas new.
	self visualizeButterflyIn: c.
	
	lb := RSLegend new.
	lb container: c.
	lb withFrame.
	lb onDemand: 'Legend'.
	lb title: 'Navigating dependencies of ', self name.
	lb text: 'Center element: the class ', self name.
	lb text: 'Left elements: classes that depends on ', self name.
	lb text: 'Right elements: dependencies of ', self name.
	lb text: 'Color: feature contribution'.
	lb build.
	^ c @ RSCanvasController

]

{ #category : #visualization }
SAJUnit >> visualizeButterflyIn: c [
	| in g out all lblOut lblIn breadCrumb centralCompositeShape lblCentral lblFeatures featureContainer titleFeature |
	
	in := RSGroup new.
	self incomingUnits do: [ :u |
		g := RSGroup new.
		u visualizeIn: g.
		in add: g asShape.
	].
	out := RSGroup new.
	self outgoingUnits do: [ :u |
		g := RSGroup new.
		u visualizeIn: g.
		out add: g asShape.
	].

	c addAll: in; addAll: out.
	
	"We render the unit itself"
	g := RSGroup new.
	self visualizeIn: g.
	centralCompositeShape := g asShape.
	c add: centralCompositeShape.

	RSGridLayout on: in.
	RSGridLayout on: out.
	
	all := RSGroup new.
	all add: in.
	all add: centralCompositeShape.
	all add: out.
	RSHorizontalLineLayout new alignMiddle; gapSize: 300; on: all.

"	centralCompositeShape translateBy: g extent / -2."
	
	lblCentral := RSLabel new fontSize: 50; text: self name. 
	c add: lblCentral.
	RSLocation move: lblCentral above: centralCompositeShape.
	
	out isNotEmpty ifTrue: [
		lblOut := RSLabel new fontSize: 50; text: 'Outgoing classes (', (out size asString), ')'. 
		c add: lblOut.
		RSLocation move: lblOut above: out ]. 

	in isNotEmpty ifTrue: [
		lblIn := RSLabel new fontSize: 50; text: 'Incoming classes (', (in size asString), ')'.
		c add: lblIn.
		RSLocation move: lblIn above: in ]. 

	"BREADCRUMB"
	breadCrumb := RSLabel text: 'File ', filename.
	c add: breadCrumb.
	breadCrumb setAsFixed.
	breadCrumb translateTopLeftTo: 5 @ 5.

	"FEATURES BELOW"
	featureContainer := RSComposite new.
	featureContainer color: Color veryVeryLightGray.
	lblFeatures := RSLabel 
							models: self features 
							forEach: [ :lbll :feat | lbll text: feat name; fontSize: 50 ].
	lblFeatures @ RSHighlightable red.

	"RSVerticalLineLayout on: { { titleFeature } asGroup, lblFeatures } asGroup."
	RSGridLayout new gapSize: 20; on: lblFeatures.

	titleFeature := RSLabel new color: Color black; fontSize: 40; text: 'Features that contribute to ', self name.
	RSLocation new
		above;
		move: titleFeature on: lblFeatures.

	featureContainer shapes: { titleFeature }, lblFeatures. 
	c add: featureContainer.
	RSLocation new below; center; move: featureContainer on: all.
	featureContainer translateBy: 0 @ 80.
]

{ #category : #visualization }
SAJUnit >> visualizeIn: c [
	| b ab |
	
	b := RSBox model: self.
	b @ RSPopup.
	b fromRectangle: ((-25 @ 0) corner: (25 @ self loc)).
	b width: 50.
	c add: b.
	
	"b when: RSMouseClick do: [ :evt | self visualizeButterfly open ]."
	
	b @ (RSMenuActivable new menuDo: [ :menu :element | 
		menu add: 'Source code' target: element model selector: #inspectSourceCode.
		menu add: 'Inspect' target: element model selector: #inspect. ] ).
	
	self annotations do: [ :a |
		ab := RSBox model: a.
		ab @ RSPopup.
		a feature isSelected 
			ifTrue: [ ab color: (a feature color alpha: 0.4) ]
			ifFalse: [ ab color: (Color gray darker darker) ].
		ab fromRectangle: ((-25 @ a from) corner: (25 @ (a to + 1))).
		ab translateBy: (a depth * 20) @ 0.
		c add: ab.
	].

]

{ #category : #visualization }
SAJUnit >> visualizeInContainer: compo [
	self features do: [ :feat |
		| aSize |
		aSize := ((feat anotationsForUnit: self) collect: #numberOfLinesOfCode) sum sqrt * 4.
		compo add: (RSBox new model: self; size: aSize; model: feat; color: (feat color)).
	].
	compo children @ RSPopup.
	RSGridLayout on: compo children.
	

]
