Class {
	#name : #PWBSpRoassal,
	#superclass : #SpPresenter,
	#instVars : [
		'roassal',
		'model'
	],
	#category : #PWBVisulaization
}

{ #category : #specs }
PWBSpRoassal class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		add: #roassal;
		yourself
]

{ #category : #private }
PWBSpRoassal >> buildRoassalViewOn: v [
	| sb eb |
	sb := RSShapeBuilder circle
		color: [ :node | 
			"self halt."
			((model mainTreeFocus includes: node) or: model mainTreeFocus = node)
				ifTrue: [ Color green ]
				ifFalse: [ Color gray ] ];
		interactionDo: [ :i | 
			i
				draggable;
				popup ].
	v addAll: (sb elementsOn: model mooseModel flatten).
	eb := RSEdgeBuilder line.
	eb
		view: v;
		moveBehind;
		connectToAll: [ :each | each outgoingReferences collectAsSet: #target ].
	RSForceBasedLayout new
		doNotUseProgressBar;
		on: v elements.
	v @ RSControlsView.
	v zoomToFit
]

{ #category : #initialization }
PWBSpRoassal >> initializeWidgets [
roassal := self instantiate: RoassalPresenter
]

{ #category : #accessing }
PWBSpRoassal >> model [
	^ model
]

{ #category : #accessing }
PWBSpRoassal >> model: anObject [
	model := anObject.
	model subscribeToMainTreeChannel: self.
	self updateRoassal
]

{ #category : #'private-actions' }
PWBSpRoassal >> notifyMainTreeChange [
	self updateRoassal
]

{ #category : #'private-actions' }
PWBSpRoassal >> updateRoassal [
	roassal script: [ :view | self buildRoassalViewOn: view ]
]
