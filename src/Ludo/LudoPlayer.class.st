Class {
	#name : #LudoPlayer,
	#superclass : #LudoNamedEntity,
	#instVars : [
		'tokens'
	],
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoPlayer >> goalTokens [
	^ self tokens select: #inGoalState
]

{ #category : #initialization }
LudoPlayer >> initializeTokens [
	self assert: self name first isUppercase.
	tokens := { 
		          (LudoToken named: self name).
		          (LudoToken named: self name asLowercase) } asOrderedCollection
]

{ #category : #accessing }
LudoPlayer >> playTokens [
	^ self tokens select: #inPlay
]

{ #category : #accessing }
LudoPlayer >> startTokens [
	^ self tokens select: #inStartState
]

{ #category : #accessing }
LudoPlayer >> tokens [
	^ tokens
]
