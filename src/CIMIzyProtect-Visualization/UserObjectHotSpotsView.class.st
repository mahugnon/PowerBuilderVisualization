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
		width: [ :cls | cls numberOfAttributes max: 5];
		height: [ :cls | cls numberOfMethods max: 5];
		color: Color black) elementsOn: aCollection.
	aView addAll: es.
	es @ CIMRTViewSouceCode @(RTPopup
				text: [ :elt | 
					  elt belongsTo name , '->' , elt name ,
						String cr , '  #attributes = ' , elt numberOfAttributes asString ,
						String cr , '  #methods = ' , elt numberOfMethods asString,
						String cr , '  WMC=' , elt weightedMethodCount asString ]) @ RTDraggable.
	RTEdgeBuilder new
		elements: es;
		view: aView.
	RTGridLayout new on: es.
	RTMetricNormalizer new
		elements: es;
		normalizeColorAsGray: [ :cls | cls weightedMethodCount ].
	^ aView
]
