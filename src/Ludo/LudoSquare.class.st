Class {
	#name : #LudoSquare,
	#superclass : #Object,
	#instVars : [
		'token'
	],
	#category : #'Ludo-Model'
}

{ #category : #initialization }
LudoSquare >> clear [
	self token: LudoToken blank
]

{ #category : #initialization }
LudoSquare >> initialize [
	self clear
]

{ #category : #printing }
LudoSquare >> printOn: aStream [
	aStream nextPutAll: self token name
]

{ #category : #accessing }
LudoSquare >> token [
	^ token
]

{ #category : #accessing }
LudoSquare >> token: aLudoToken [
	token := aLudoToken
]
