"
View Source Text when clicked
"
Class {
	#name : #CIMRTViewSouceCode,
	#superclass : #RTInteraction,
	#category : #'CIMIzyProtect-Visualization'
}

{ #category : #hooks }
CIMRTViewSouceCode >> initializeElement: element [
	^ element announcer
		when: TRMouseClick
		do: [ TextPresenter new
				text: element model sourceText;
				title: element model name;
				openWithSpec ]
]
