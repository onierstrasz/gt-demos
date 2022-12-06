Class {
	#name : #Subtitles,
	#superclass : #Object,
	#instVars : [
		'file',
		'entries'
	],
	#category : #GtDemos
}

{ #category : #accessing }
Subtitles class >> for: aFileReference [
	^ self new file: aFileReference
]

{ #category : #accessing }
Subtitles >> asDuration: aTime [
	"Add a DAYS field and change the comma to a period."
	^ ('00:' , aTime replaceAll: $, with: $.) asDuration
]

{ #category : #accessing }
Subtitles >> entries [
	entries ifNil: [ self initializeEntries ].
	^ entries
]

{ #category : #accessing }
Subtitles >> entries: anObject [

	entries := anObject
]

{ #category : #accessing }
Subtitles >> file [

	^ file
]

{ #category : #initialization }
Subtitles >> file: aFileReference [
	file := aFileReference
]

{ #category : #ui }
Subtitles >> gtEntriesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Entries';
		priority: 10;
		items: [ self entries ];
		column: 'Start' text: [ :entry | entry at: #start ];
		column: 'End' text: [ :entry | entry at: #end ];
		column: 'Lines' text: [ :entry | ' ' join: (entry at: #lines) ]
]

{ #category : #initialization }
Subtitles >> initializeEntries [
	entries := ((String crlf repeat: 2) split: self file asFileReference contents)
			collect: [ :each | 
				| lines times |
				lines := String crlf split: each.
				times := '--> ' split: lines second.
				{#start -> (self asDuration: times first).
					#end -> (self asDuration: times second).
					#lines -> (lines allButFirst: 2)} asDictionary ]
]

{ #category : #accessing }
Subtitles >> timeAsDuration [
	^ ('00:' , (' --> ' split: (self entries first at: #time)) first
		replaceAll: $,
		with: $.) asDuration
]
