Class {
	#name : #Subtitles,
	#superclass : #Object,
	#instVars : [
		'file'
	],
	#category : #GtDemos
}

{ #category : #accessing }
Subtitles class >> for: aFileReference [
	^ self new file: aFileReference
]

{ #category : #initialization }
Subtitles >> file: aFileReference [
	file := aFileReference
]
