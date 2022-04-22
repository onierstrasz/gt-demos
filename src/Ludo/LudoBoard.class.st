"
I contain all the pieces that represent the game state and that need to be rendered.
I don't manage the game logic, which is in LudoGame.
"
Class {
	#name : #LudoBoard,
	#superclass : #Object,
	#instVars : [
		'players',
		'squares',
		'tokenDict'
	],
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoBoard >> initialize [

	players := OrderedCollection new.
	($A to: $D) do: [ :player | 
		players add: (LudoPlayer new name: player) ].

	squares := OrderedCollection new.
	1 to: 40 do: [ :n | squares add: LudoSquare new ].

	"Do we need a dictionary of tokens, or should each player just know its tokens?
	We need to keep track of which tokens are in the start corner, which are in play, and which have reached their goal."
	
	tokenDict := Dictionary new.
	players do: [ :player | 
		self assert: player name first isUppercase.
		tokenDict at: player put: { 
				(LudoToken named: player name).
				(LudoToken named: player name asLowercase) } ]
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
	^ tokenDict values flatten
]
