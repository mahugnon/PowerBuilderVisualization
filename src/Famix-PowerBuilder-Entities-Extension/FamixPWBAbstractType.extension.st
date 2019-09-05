Extension { #name : #FamixPWBAbstractType }

{ #category : #'*Famix-PowerBuilder-Entities-Extension' }
FamixPWBAbstractType >> mooseNameOn: aStream [
	self typeContainer
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPutAll: '::' ].
	self name ifNotNil: [ :aName | aStream nextPutAll: aName ]
]
