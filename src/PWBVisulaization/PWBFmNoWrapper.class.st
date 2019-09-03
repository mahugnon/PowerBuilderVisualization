Class {
	#name : #PWBFmNoWrapper,
	#superclass : #Object,
	#instVars : [
		'mooseEntity'
	],
	#category : #PWBVisulaization
}

{ #category : #testing }
PWBFmNoWrapper class >> isWrapperOf: aFmStClass [
	^ aFmStClass isEmptyOrNil
]

{ #category : #accessing }
PWBFmNoWrapper >> content [
	^ {  }
]

{ #category : #accessing }
PWBFmNoWrapper >> mooseEntity [
	^ mooseEntity
]

{ #category : #accessing }
PWBFmNoWrapper >> mooseEntity: anObject [
	mooseEntity := anObject
]
