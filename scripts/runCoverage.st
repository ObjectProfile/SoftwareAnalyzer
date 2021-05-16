Metacello new 
	baseline: 'Spy2'; 
	repository: 'github://ObjectProfile/Spy2'; 
	load: 'HapaoCore'.

[Metacello new
    baseline: 'Roassal3';
    repository: 'github://ObjectProfile/Roassal3';
    load: 'Full' ] on: MCMergeOrLoadWarning do: [:warning | warning load ].

Metacello new
    baseline: 'Roassal3Exporters';
    repository: 'github://ObjectProfile/Roassal3Exporters';
    load.


profiler := 'Hapao2' asClass runTestsForPackagesMatching: 'Roassal3*'.

classSizeScale := NSScale linear range: #(5 30); domain: { 0 . (profiler allClasses max: #numberOfMethods) }.
classColorCoverage := NSScale linear range: {Color red . Color black}; domain: { 0 . 100 }.
m := RSMondrian new.
m shape labeled: #packageName; color: Color white; borderColor: Color gray.
m nodes: profiler packages forEach: [ :pak |
	m shape box 
		size: [ :cls | classSizeScale scale: cls numberOfMethods ];
		color: [ :cls | classColorCoverage scale: cls coverage ];
		if: #isTestClass color: Color green darker.
	m nodes: pak classes.
	m orthoVerticalLine connectFrom: #superclass.
	m layout tidyTree
].
m build.

[ RSPNGExporter new
	canvas: m canvas;
	exportToFile: 'coverage.png' asFileReference ] on: Error do: [:ex | "do nothing" ].

SmalltalkImage current quitPrimitive
