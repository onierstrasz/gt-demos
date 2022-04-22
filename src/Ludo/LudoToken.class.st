"
I am a token belonging to a LudoPlayer. I move around the LudoBoard, following the rules of the game.
I know my state (#start, #play or #goal) and when I am in play, I know which square I am on.
"
Class {
	#name : #LudoToken,
	#superclass : #LudoNamedEntity,
	#instVars : [
		'state',
		'square'
	],
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoToken class >> blank [
	^ self named: ' '
]

{ #category : #accessing }
LudoToken >> enterPlayOnSquare: aSquare [

	"Where do we take into account if the square is already occupied, by a token of the same player or another one? 
	NB: This is the job of the Game, not the Board or the Token."

	aSquare token: self.
	state := #play.
	square := aSquare.
	^ aSquare
]

{ #category : #testing }
LudoToken >> inGoalState [
	^ state = #goal
]

{ #category : #testing }
LudoToken >> inPlay [
	^ state = #play
]

{ #category : #testing }
LudoToken >> inStartState [
	^ state = #start
]

{ #category : #initialization }
LudoToken >> initialize [
	super initialize.
	state := #start
	"Should we initialize square to a dummy square?
	It is only expected to have a value if state is #play."
]

{ #category : #accessing }
LudoToken >> state [
	^ state
]
