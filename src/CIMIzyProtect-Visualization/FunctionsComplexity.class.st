Class {
	#name : #FunctionsComplexity,
	#superclass : #CIMRoassalPresenter,
	#category : #'CIMIzyProtect-Visualization'
}

{ #category : #drawing }
FunctionsComplexity >> draw: aCollection [
	| lb b |
	b := RTMondrian new.
	b shape rectangle
		width: [ :f | f variables size ];
		height: [ :f | f numberOfLinesOfCode / 4 ].
	b nodes: aCollection.
	"b edges connectFrom: #superclass."
	b layout tree.
	b normalizer
		normalizeColorAsGray: [ :f | f cyclomaticComplexity * 5 ].
	b build.
	lb := RTLegendBuilder new.
	lb onDemand: '+Info'.
	lb view: b view.
	lb addText: 'Function complexity view'.
	lb
		addRectanglePolymetricWidth: 'Cyclomatic complexity'
		height: 'Line of code'
		box: 'a Liquidation function'.
	lb build.
	^ b view
]
