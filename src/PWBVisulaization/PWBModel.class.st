Class {
	#name : #PWBModel,
	#superclass : #SpPresenter,
	#instVars : [
		'roassaViewListeners',
		'mainTreeListeners',
		'mooseModel',
		'mainTreeFocus'
	],
	#category : #PWBVisulaization
}

{ #category : #initialization }
PWBModel >> initialize [
	super initialize.
	roassaViewListeners := OrderedCollection new.
	mainTreeListeners := OrderedCollection new.
	mainTreeFocus := PWBFmNoWrapper new
]

{ #category : #accessing }
PWBModel >> mainTreeFocus [
	^ mainTreeFocus content
]

{ #category : #api }
PWBModel >> mainTreeFocus: aFmWrapper [
	mainTreeFocus := aFmWrapper.
	self notifyMainTreeListeeners
]

{ #category : #accessing }
PWBModel >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
PWBModel >> mooseModel: aCollection [
	mooseModel := aCollection
]

{ #category : #api }
PWBModel >> notifyMainTreeListeeners [
	mainTreeListeners do: #notifyMainTreeChange
]

{ #category : #api }
PWBModel >> subscribeToMainTreeChannel: anObject [
	mainTreeListeners add: anObject
]

{ #category : #api }
PWBModel >> subscribeToRoassaViewChannel: anObject [
	roassaViewListeners add: anObject
]
