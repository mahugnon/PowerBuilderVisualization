Class {
	#name : #FunctionsComplexity,
	#superclass : #CIMRoassalPresenter,
	#category : #'CIMIzyProtect-Visualization'
}

{ #category : #drawing }
FunctionsComplexity >> draw: aCollection [
	| es aView |
	aView := RTView new.
	aView @ RTZoomableView @ RTDraggableView.
	es := (RTBox new
		borderColor: Color black;
		width: [ :cls | cls variables size * 5 max: 5 ];
		height: [ :cls | cls numberOfLinesOfCode ];
		color: Color black) elementsOn: aCollection.
	aView addAll: es.
	es @ CIMRTViewSouceCode
		@
			(RTPopup
				text: [ :elt | 
					elt belongsTo belongsTo name , '->' , elt belongsTo name , '->'
						, elt name ]) @ RTDraggable.
	RTEdgeBuilder new
		elements: es;
		view: aView.
	RTTreeLayout new on: es.
	RTMetricNormalizer new
		elements: es;
		normalizeColorAsGray: [ :cls | cls cyclomaticComplexity ].
	^ aView
]
