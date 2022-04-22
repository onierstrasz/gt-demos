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

{ #category : #accessing }
LudoNamedEntity class >> named: aString [
	^ self new
		  name: aString;
		  yourself
]

{ #category : #accessing }
LudoNamedEntity >> name [
	^ name
]

{ #category : #accessing }
LudoNamedEntity >> name: aStringOrChar [
	name := aStringOrChar asString
]

{ #category : #accessing }
LudoNamedEntity >> printOn: aStream [
	aStream nextPutAll: self name
]
