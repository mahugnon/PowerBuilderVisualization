Class {
	#name : #PBObjectCycloPerLOC,
	#superclass : #AbstractMetricTreshold,
	#instVars : [
		'cycloPerLoc'
	],
	#category : #'CIMIzyProtect-Visualization-MetricTresholds'
}

{ #category : #accessing }
PBObjectCycloPerLOC >> averageMinusStdev [
	^ cycloPerLoc average - cycloPerLoc stdev
]

{ #category : #accessing }
PBObjectCycloPerLOC >> averagePlusStdev [
	^ cycloPerLoc average + cycloPerLoc stdev
]

{ #category : #accessing }
PBObjectCycloPerLOC >> high [
	^ self averagePlusStdev * 1.5
]

{ #category : #accessing }
PBObjectCycloPerLOC >> initCycloPerLoc [
	cycloPerLoc := (model
		collect:
			[ :obj | (obj weightedMethodCount / obj sourceText linesOfCode) asFloat ])
		asDataSeries asDataFrame
]

{ #category : #accessing }
PBObjectCycloPerLOC >> model: aCollection [
	model := aCollection.
	self initCycloPerLoc
]
