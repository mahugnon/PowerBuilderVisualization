Class {
	#name : #PWAbstractWrapper,
	#superclass : #Object,
	#instVars : [
		'mooseEntity'
	],
	#category : #PWBVisulaization
}

{ #category : #'instance creation' }
PWAbstractWrapper class >> createWrapper: wrapper for: aFamixSTClass [
	^ wrapper new
		mooseEntity: aFamixSTClass;
		yourself
]

{ #category : #testing }
PWAbstractWrapper class >> isWrapperOf: aFmStClass [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
PWAbstractWrapper class >> wrap: aFamixSTClass [
	| wrapped |
	self subclasses
		detect: [ :sub | sub isWrapperOf: aFamixSTClass ]
		ifFound:
			[ :wrapper | wrapped := self createWrapper: wrapper for: aFamixSTClass ]
		ifNone:
			[ wrapped := self createWrapper: PWBFmNoWrapper for: aFamixSTClass ].
	^ wrapped
]

{ #category : #accessing }
PWAbstractWrapper >> content [
	^ self subclassResponsibility
]

{ #category : #accessing }
PWAbstractWrapper >> mooseEntity [
	^ mooseEntity
]

{ #category : #accessing }
PWAbstractWrapper >> mooseEntity: anObject [
	mooseEntity := anObject
]
