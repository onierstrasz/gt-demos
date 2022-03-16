Class {
	#name : #CardElement,
	#superclass : #BlElement,
	#instVars : [
		'card',
		'face',
		'back'
	],
	#category : #'Tutorial-MemoryGame-UI'
}

{ #category : #'visual properties' }
CardElement >> backgroundColor [
	^ Color lightBlue
]

{ #category : #accessing }
CardElement >> card [
	^ card
]

{ #category : #accessing }
CardElement >> card: aDMGCard [
	card ifNotNil: [ :anOldCard | anOldCard announcer unsubscribe: self ].
	card := aDMGCard.
	card announcer when: CardFlipped send: #onFlipped to: self.
	card announcer when: CardDisappeared send: #onDisappear to: self.
	self onUpdated.
]

{ #category : #'visual properties' }
CardElement >> cardSize [
	^ 80 @ 80
]

{ #category : #'visual properties' }
CardElement >> foregroundColor [
	^ Color gray
]

{ #category : #initialization }
CardElement >> initialize [
	super initialize.
	self layout: BlFrameLayout new.
	self size: self cardSize.
	self background: self backgroundColor.
	self geometry: (BlRectangle cornerRadius: 12).
	self initializeFace.
	self addChild: face.
	self initializeBack.
	self addChild: back.
]

{ #category : #initialization }
CardElement >> initializeBack [
	back := BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	back
		addChild: (BlLineElement new
			border: (BlBorder paint: self foregroundColor width: 1);
			fromAnchor: (BlElementTopLeftAnchor new referenceElement: back);
			toAnchor: (BlElementBottomRightAnchor new referenceElement: back);
			yourself);
		addChild: (BlLineElement new
			border: (BlBorder paint: self foregroundColor width: 1);
			fromAnchor: (BlElementTopRightAnchor new referenceElement: back);
			toAnchor: (BlElementBottomLeftAnchor new referenceElement: back);
			yourself).
]

{ #category : #initialization }
CardElement >> initializeFace [
	face := BlTextElement new text: '?' asRopedText.
	face constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	face visibility: BlVisibility hidden.
]

{ #category : #hooks }
CardElement >> onDisappear [
	self visibility: BlVisibility hidden.
]

{ #category : #hooks }
CardElement >> onFlipped [
	self card isFlipped
		ifTrue: [ self onFlippedFace ] 
		ifFalse: [ self onFlippedBack ]
]

{ #category : #hooks }
CardElement >> onFlippedBack [
	face visibility: BlVisibility hidden.
	back visibility: BlVisibility visible.
]

{ #category : #hooks }
CardElement >> onFlippedFace [
	face visibility: BlVisibility visible.
	back visibility: BlVisibility hidden.
]

{ #category : #hooks }
CardElement >> onUpdated [
	self card ifNil: [ ^ self ].
	face text: (self card symbol asString asRopedText
		fontSize: self symbolFontSize;
		foreground: self foregroundColor).
	self onFlipped.
]

{ #category : #'visual properties' }
CardElement >> symbolFontSize [
	^ 50
]
