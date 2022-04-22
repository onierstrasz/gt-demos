Class {
	#name : #LudoSquare,
	#superclass : #Object,
	#instVars : [
		'token'
	],
	#category : #'Ludo-Model'
}

{ #category : #accessing }
LudoSquare >> initialize [
	self token: LudoToken blank
]

{ #category : #accessing }
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
