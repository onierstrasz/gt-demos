"
I am a token belonging to a LudoPlayer. I move around the LudoBoard, following the rules of the game.
I know my state (#start, #play or #goal) and when I am in play, I know which square I am on.
"
Class {
	#name : #LudoToken,
	#superclass : #LudoNamedEntity,
	#instVars : [
		'state'
	],
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoToken class >> blank [
	^ self named: ' '
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
]

{ #category : #accessing }
LudoToken >> state [
	^ state
]
