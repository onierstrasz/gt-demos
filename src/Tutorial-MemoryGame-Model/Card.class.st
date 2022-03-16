Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'flipped',
		'announcer'
	],
	#category : #'Tutorial-MemoryGame-Model'
}

{ #category : #accessing }
Card >> announcer [
	^ announcer
]

{ #category : #actions }
Card >> disappear [
	self notifyDisappear
]

{ #category : #actions }
Card >> flip [
	flipped := flipped not.
	self notifyFlipped
]

{ #category : #initialization }
Card >> initialize [
	super initialize.
	flipped := false.
	announcer := Announcer new.
]

{ #category : #testing }
Card >> isFlipped [
	^ flipped
]

{ #category : #notifying }
Card >> notifyDisappear [
	self announcer announce: CardDisappeared new
]

{ #category : #notifying }
Card >> notifyFlipped [
	self announcer announce: CardFlipped new
]

{ #category : #accessing }
Card >> printOn: aStream [
	self isFlipped ifNil: [ ^ super printOn: aStream ].
	aStream
		nextPutAll: 'Card: ';
		nextPutAll: self symbol asString;
		nextPutAll: (self isFlipped ifTrue: [ ' (face side)' ] ifFalse: [ ' (back side)' ])
]

{ #category : #accessing }
Card >> symbol [
	^ symbol
]

{ #category : #accessing }
Card >> symbol: anObject [
	symbol := anObject
]
