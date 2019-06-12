Extension { #name : #FamixPWBBehavioral }

{ #category : #'*CIMIzyProtect-Visualization' }
FamixPWBBehavioral >> cimClickedEvent [
1halt.
	^ TextPresenter new
		text: self sourceText;
		openWithSpec
]
