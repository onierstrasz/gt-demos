Class {
	#name : #GameElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Tutorial-MemoryGame-UI'
}

{ #category : #accessing }
GameElement >> game [
	^ game
]

{ #category : #accessing }
GameElement >> game: aGame [
	game := aGame.
	self onUpdated
]

{ #category : #initialize }
GameElement >> initialize [
	super initialize.
	self layout: BlGridLayout horizontal.
	self layout cellSpacing: 7.
	self background: Color gray.
	self constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].
]

{ #category : #'instance creation' }
GameElement >> newCardElement [
	^ CardElement new
]

{ #category : #hooks }
GameElement >> onUpdated [
	self game ifNil: [ ^ self ].
	self removeChildren.
	self layout columnCount: self game gridSize.
	self game availableCards do: [ :aCard | 
		| aCardElement |
		aCardElement := self newCardElement card: aCard.	
		self addChild: aCardElement ]
]
