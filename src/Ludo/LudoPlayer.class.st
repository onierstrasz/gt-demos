Class {
	#name : #LudoPlayer,
	#superclass : #LudoNamedEntity,
	#instVars : [
		'tokens'
	],
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoPlayer >> initializeTokens [
	self assert: self name first isUppercase.
	tokens := { 
		          (LudoToken named: self name).
		          (LudoToken named: self name asLowercase) } asOrderedCollection
]

{ #category : #accessing }
LudoPlayer >> tokens [
	^ tokens
]
