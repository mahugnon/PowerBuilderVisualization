Class {
	#name : #BaselineOfCIMIzyProtectVisualization,
	#superclass : #BaselineOf,
	#category : #BaselineOfCIMIzyProtectVisualization
}

{ #category : #baselines }
BaselineOfCIMIzyProtectVisualization >> baseline: spec [
	spec
		for: #common
		do: [ "Dependencies"
			self baselineOfDataFrame: spec.
			self baselineOfPowerBuilderParser: spec.

			"Packages "
			spec
				package: 'CIMIzyProtect-Visualization'
				with: [ spec requires: #('PowerBuilder-Parser-Visitor' 'DataFrame') ] ]
]

{ #category : #baselines }
BaselineOfCIMIzyProtectVisualization >> baselineOfDataFrame: spec [
	spec
    	baseline: 'DataFrame'
    	with:[ spec repository: 'github://PolyMathOrg/DataFrame:master/src' ]
]

{ #category : #baselines }
BaselineOfCIMIzyProtectVisualization >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://Larcheveque/PowerBuilderParser:master/src' ]
]
