Class {
	#name : #CardEventListener,
	#superclass : #BlElementEventListener,
	#instVars : [
		'game'
	],
	#category : #'Tutorial-MemoryGame-UI'
}

{ #category : #'mouse handlers' }
CardEventListener >> clickEvent: anEvent [
	self game ifNil: [ ^ self ].
	self game chooseCard: anEvent currentTarget card
]

{ #category : #accessing }
CardEventListener >> game [
	^ game
]

{ #category : #accessing }
CardEventListener >> game: anObject [
	game := anObject
]
