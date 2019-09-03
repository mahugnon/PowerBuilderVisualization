Class {
	#name : #PWBFmGroupWrapper,
	#superclass : #PWAbstractWrapper,
	#category : #PWBVisulaization
}

{ #category : #testing }
PWBFmGroupWrapper class >> isWrapperOf: aFmStClass [
	^ MooseGroup withAllSubclasses includes: aFmStClass class
]

{ #category : #accessing }
PWBFmGroupWrapper >> content [
	^ mooseEntity asCollection
]
