Class {
	#name : #AbstractMetricTreshold,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'CIMIzyProtect-Visualization-MetricTresholds'
}

{ #category : #accessing }
AbstractMetricTreshold >> averageMinusStdev [
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractMetricTreshold >> averagePlusStdev [
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractMetricTreshold >> high [
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractMetricTreshold >> model [
	^ model
]

{ #category : #accessing }
AbstractMetricTreshold >> model: anObject [
	model := anObject
]
