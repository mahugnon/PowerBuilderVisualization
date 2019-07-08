Class {
	#name : #CommandLineRunner,
	#superclass : #CommandLineHandler,
	#category : #'PowerBuilder-Parser-CommandLineRunner'
}

{ #category : #accessing }
CommandLineRunner class >> commandName [
	" Overwrite this method to provide a short name for this command handler.
	You may pass the commandName as first argument to the image to select this handler"
	^ 'runPWBParserOn'
]

{ #category : #accessing }
CommandLineRunner class >> description [
	^ 'Directly Generate the PWB model of the parsed argument. The given argument should be a PWBLibrarie'
]

{ #category : #activation }
CommandLineRunner >> activate [
	self activateHelp.
	self arguments ifEmpty: [ WorldState quitSession ].
	self generateMooseModel: (self arguments first).
	WorldState saveAndQuit.
	self quit
]

{ #category : #activation }
CommandLineRunner >> generateMooseModel: aFolder [
	(PWBFamixImporter importFromFolder: aFolder)
		name: aFolder asFileReference basename , 'MooseModel';
		install
]
