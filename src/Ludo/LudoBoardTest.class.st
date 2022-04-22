Class {
	#name : #LudoBoardTest,
	#superclass : #Object,
	#category : #'Ludo-Tests'
}

{ #category : #accessing }
LudoBoardTest >> emptyBoard [
	<gtExample>
	| board |
	board := LudoBoard new.
	self assert: board players size equals: 4.
	self assert: board squares size equals: 40.
	self assert: board tokens size equals: 8.
	^ board
]
