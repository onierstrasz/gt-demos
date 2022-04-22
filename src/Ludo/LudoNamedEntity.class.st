"
I am an abstract superclass of Ludo entities that have a printable name.
"
Class {
	#name : #LudoNamedEntity,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Ludo-Model'
}

{ #category : #creation }
LudoNamedEntity class >> named: aString [
	^ self new
		  name: aString;
		  yourself
]

{ #category : #constants }
LudoNamedEntity >> defaultName [
	^ 'undefined'
]

{ #category : #initialization }
LudoNamedEntity >> initialize [
	super initialize.
	name := self defaultName
]

{ #category : #accessing }
LudoNamedEntity >> name [
	^ name
]

{ #category : #accessing }
LudoNamedEntity >> name: aStringOrChar [
	name := aStringOrChar asString
]

{ #category : #printing }
LudoNamedEntity >> printOn: aStream [
	aStream nextPutAll: self name
]
