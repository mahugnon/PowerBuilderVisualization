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
	mainTreeListeners := OrderedCollection new
]

{ #category : #accessing }
PWBModel >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
PWBModel >> mooseModel: aCollection [
	mooseModel := aCollection
]

{ #category : #'as yet unclassified' }
PWBModel >> notifyMainTreeListeeners [
	mainTreeListeners do: #notifyMainTreeChange
]

{ #category : #'as yet unclassified' }
PWBModel >> subscribeToMainTreeChannel: anObject [
	mainTreeListeners add: anObject
]

{ #category : #'as yet unclassified' }
PWBModel >> subscribeToRoassaViewChannel: anObject [
	roassaViewListeners add: anObject
]
