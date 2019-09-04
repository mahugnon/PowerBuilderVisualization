Class {
	#name : #PWBSpPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'roassalView',
		'mainTree',
		'model'
	],
	#category : #PWBVisulaization
}

{ #category : #specs }
PWBSpPresenter class >> defaultSpec [

	^ SpPanedLayout newHorizontal 
		position: 35 percent;
		add: #mainTree;
		add: #roassalView;
		yourself
]

{ #category : #examples }
PWBSpPresenter class >> example1 [
	self basicNew
		setModelBeforeInitialization: self exempleMooseModel;
		initialize;
		openWithSpec
]

{ #category : #examples }
PWBSpPresenter class >> exempleMooseModel [
	| mooseModel |
	mooseModel := MooseModel root first.
	^ FamixPWBmajorObject subclasses
		collect: [ :fmClass | mooseModel allWithType: fmClass ]
]

{ #category : #private }
PWBSpPresenter >> buildRoassalViewOn: v [
	| sb eb |
	sb := RSShapeBuilder circle
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
PWBSpPresenter >> initializeWidgets [
	roassalView := self instantiate: PWBSpRoassal.
	roassalView model: model.
	mainTree := self newTreeTable
		addColumn: (SpStringTableColumn evaluated: #name);
		roots: model mooseModel;
		children: [ :node | (PWAbstractWrapper wrap: node) content ];
		beResizable;
		activateOnDoubleClick;
		whenSelectionChangedDo:
				[ :selection | model mainTreeFocus: (PWAbstractWrapper wrap: selection selectedItem) ];
		yourself
]

{ #category : #'accessing model' }
PWBSpPresenter >> setModelBeforeInitialization: aMooseGroup [
	model := PWBModel new
		mooseModel: aMooseGroup;
		yourself.
	model subscribeToRoassaViewChannel: self
]
