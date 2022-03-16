Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'availableCards',
		'chosenCards'
	],
	#category : #'Tutorial-MemoryGame-Model'
}

{ #category : #'instance creation' }
Game class >> chinese [
	^ self new initializeForSymbols: '为从公家里地个时'
]

{ #category : #'instance creation' }
Game class >> emoji [
	^ self new initializeForSymbols: '💰🏡🎅🍪🍕🚀😸🙈'
]

{ #category : #'instance creation' }
Game class >> numbers [
	^ self new initializeForSymbols: '12345678'
]

{ #category : #accessing }
Game >> availableCards [
	^ availableCards
]

{ #category : #configuration }
Game >> cardsCount [
	^ self gridSize * self gridSize
]

{ #category : #actions }
Game >> chooseCard: aCard [
	(self chosenCards includes: aCard) 
		ifTrue: [ ^ self ].
	self chosenCards add: aCard.
	aCard flip.
	self shouldCompleteStep
		ifTrue: [ ^ self completeStep ].
	self shouldResetStep
		ifTrue: [ self resetStep ]
]

{ #category : #testing }
Game >> chosenCardMatch [
	| firstCard |
	firstCard := self chosenCards first.
	^ self chosenCards allSatisfy: [ :aCard | 
		aCard isFlipped and: [ firstCard symbol = aCard symbol ] ]
]

{ #category : #accessing }
Game >> chosenCards [
	^ chosenCards
]

{ #category : #private }
Game >> completeStep [
	self chosenCards 
		do: [ :aCard | aCard disappear ];
		removeAll.
]

{ #category : #configuration }
Game >> gridSize [
	^ 4
]

{ #category : #accessing }
Game >> gtAvailableCardsFor: aView [

	<gtView>
	self availableCards ifNil: [ ^ aView empty ].
	^ aView columnedList
		  title: 'Cards';
		  items: [ self availableCards ];
		  column: 'Card' text: [ :rowObject :rowIndex :columnIndex | 
			  | aComputedItem |
			  aComputedItem := [ :aCard | aCard ]
				                   phlowValue: rowObject
				                   withEnoughArguments: { 
						                   rowObject.
						                   rowIndex.
						                   columnIndex }.
			  [ :aCard | 
			  aCard isFlipped
				  ifFalse: [ aCard printString asRopedText foreground: Color gray ]
				  ifTrue: [ aCard printString asRopedText ] ]
				  phlowValue: aComputedItem
				  withEnoughArguments: { 
						  aComputedItem.
						  rowIndex.
						  columnIndex } ]
]

{ #category : #initialization }
Game >> initialize [
	super initialize.
	availableCards := OrderedCollection new.
	chosenCards := OrderedCollection new
]

{ #category : #initialization }
Game >> initializeForSymbols: aCollectionOfCharacters [
	self
		assert: [ aCollectionOfCharacters size = (self cardsCount / self matchesCount) ]
		description: [ 'Amount of characters must be equal to possible all combinations' ].
	availableCards := (aCollectionOfCharacters asArray
			collect: [ :aSymbol | 
				(1 to: self matchesCount) collect: [ :i | 
					Card new symbol: aSymbol ] ] ) flattened shuffled asOrderedCollection
]

{ #category : #configuration }
Game >> matchesCount [
	^ 2
]

{ #category : #private }
Game >> resetStep [
	| lastCard |
	lastCard := self chosenCards last.
	self chosenCards 
		allButLastDo: [ :aCard | aCard flip ];
		removeAll;
		add: lastCard
]

{ #category : #testing }
Game >> shouldCompleteStep [
	^ self chosenCards size = self matchesCount
		and: [ self chosenCardMatch ]
]

{ #category : #testing }
Game >> shouldResetStep [ 
	^ self chosenCards size > self matchesCount
]
