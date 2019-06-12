Class {
	#name : #UserObjectHotSpotsView,
	#superclass : #CIMRoassalPresenter,
	#category : #'CIMIzyProtect-Visualization'
}

{ #category : #drawing }
UserObjectHotSpotsView >> draw: aCollection [
	| es aView |
	aView := RTView new.
	aView @ RTZoomableView @ RTDraggableView.
	es := (RTBox new
		borderColor: Color black;
		width: [ :cls | cls numberOfAttributes ];
		height: [ :cls | cls numberOfMethods ];
		color: Color black) elementsOn: aCollection.
	aView addAll: es.
	es @ CIMRTViewSouceCode @ RTPopup @ RTDraggable.
	RTEdgeBuilder new
		elements: es;
		view: aView.
	RTFlowLayout new on: es.
	RTMetricNormalizer new
		elements: es;
		normalizeColorAsGray: [ :cls | cls weightedMethodCount ].
	^ aView
]
