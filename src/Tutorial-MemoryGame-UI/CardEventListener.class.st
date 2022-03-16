Class {
	#name : #CardEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'game',
		'animation'
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

{ #category : #'mouse handlers' }
CardEventListener >> mouseEnterEvent: anEvent [
	self stopAnimation.
	animation := (BlTransformAnimation scale: 1.1 @ 1.1)
		absolute;
		duration: 0.5 seconds.
	anEvent currentTarget addAnimation: animation
]

{ #category : #'mouse handlers' }
CardEventListener >> mouseLeaveEvent: anEvent [
	self stopAnimation.
	animation := (BlTransformAnimation scale: 1.0 @ 1.0)
		absolute;
		duration: 0.5 seconds.
	anEvent currentTarget addAnimation: animation
]

{ #category : #private }
CardEventListener >> stopAnimation [
	animation ifNotNil: [ :anAnimation | anAnimation isRunning ifTrue: #stop ].
]
