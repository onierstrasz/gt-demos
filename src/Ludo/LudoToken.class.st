Class {
	#name : #LudoToken,
	#superclass : #LudoNamedEntity,
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoToken class >> blank [
	^ self named: ' '
]
