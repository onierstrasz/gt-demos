Class {
	#name : #LudoGameTest,
	#superclass : #Object,
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoGameTest >> emptyGame [
	<gtExample>
	| game |
	game := LudoGame new.
	^ game
]
