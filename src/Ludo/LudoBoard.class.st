"
I contain all the pieces that represent the game state and that need to be rendered.
I don't manage the game logic, which is in LudoGame.
"
Class {
	#name : #LudoBoard,
	#superclass : #Object,
	#instVars : [
		'players',
		'squares'
	],
	#category : #'Ludo-Model'
}

{ #category : #initialization }
LudoBoard >> initialize [
	super initialize.
	
	players := OrderedCollection new.
	($A to: $D) do: [ :player | 
		players add: (LudoPlayer new name: player) ].

	squares := OrderedCollection new.
	1 to: 40 do: [ :n | squares add: LudoSquare new ].

	players do: #initializeTokens
]

{ #category : #accessing }
LudoBoard >> players [
	^ players
]

{ #category : #accessing }
LudoBoard >> squares [
	^ squares
]

{ #category : #accessing }
LudoBoard >> tokens [
	^ players flatCollect: #tokens
]
