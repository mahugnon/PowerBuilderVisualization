Class {
	#name : #PWBFmObjectWrapper,
	#superclass : #PWAbstractWrapper,
	#category : #PWBVisulaization
}

{ #category : #testing }
PWBFmObjectWrapper class >> isWrapperOf: aFmStClass [
	^ FamixPWBmajorObject subclasses includes: aFmStClass class
]

{ #category : #accessing }
PWBFmObjectWrapper >> content [
	^ {}
]
