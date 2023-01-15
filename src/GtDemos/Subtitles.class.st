"
Load in a subtitle file as follows:

```
subs := Subtitles for: 'subs.srt' asFileReference
```

Adjust the subs like this:

```
subs scale: 1 to: 2 minutes + 30 seconds and: 415 to: 1 hour + 33 minutes
```

Then write out the new subs:
```
subs writeNewContents
```

"
Class {
	#name : #Subtitles,
	#superclass : #Object,
	#instVars : [
		'file',
		'entries'
	],
	#category : #GtDemos
}

{ #category : #'instance creation' }
Subtitles class >> for: aFileReference [
	^ self new file: aFileReference
]

{ #category : #conversion }
Subtitles >> asDuration: aTime [
	"Add a DAYS field and change the comma to a period."
	^ ('00:' , aTime replaceAll: $, with: $.) asDuration
]

{ #category : #conversion }
Subtitles >> durationAsTime: aDuration [
	"Adapted from Duration>>#printOn:"

	| h m s n stream |
	stream := WriteStream on: String new.
	h := aDuration hours abs.
	m := aDuration minutes abs.
	s := aDuration seconds abs truncated.
	n := aDuration nanoSeconds abs.
	aDuration negative ifTrue: [ stream nextPut: $- ].
	h < 10 ifTrue: [ stream nextPut: $0 ].
	h printOn: stream.
	stream nextPut: $:.
	m < 10 ifTrue: [ stream nextPut: $0 ].
	m printOn: stream.
	stream nextPut: $:.
	s < 10 ifTrue: [ stream nextPut: $0 ].
	s printOn: stream.
	n = 0
		ifFalse: [ | ps |
			stream nextPut: $,.
			ps := n asString padLeftTo: 9 with: $0.
			ps
				from: 1
				to: 3
				do: [ :c | stream nextPut: c ] ].
	^ stream contents
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
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Index' text: [ :entry :index | index ];
		column: 'Start' text: [ :entry | entry start ];
		column: 'End' text: [ :entry | entry end ];
		column: 'New Start' text: [ :entry | entry newStart ];
		column: 'New End' text: [ :entry | entry newEnd ];
		column: 'Lines' text: [ :entry | entry joinedLines ]
]

{ #category : #initialization }
Subtitles >> initializeEntries [
	entries := ((String crlf repeat: 2) split: self file asFileReference contents)
			collectWithIndex: [ :each : index | 
				| lines times |
				lines := String crlf split: each.
				times := '--> ' split: lines second.
			"	{#start -> (self asDuration: times first).
					#end -> (self asDuration: times second).
					#newStart -> (self asDuration: times first).
					#newEnd -> (self asDuration: times second).
					#lines -> (lines allButFirst: 2)} asDictionary"
					
				Subtitle new
					number: index;
					start: (self asDuration: times first);
					end: (self asDuration: times second);
					lines: (lines allButFirst: 2)
					
					
					
					 ]
]

{ #category : #conversion }
Subtitles >> newContents [
	| stream |
	stream := WriteStream on: String new.
	self entries
		doWithIndex: [ :each :index | 
			stream
				nextPutAll: index asString;
				nextPutAll: String crlf;
				nextPutAll: (self durationAsTime: (each newStart));
				nextPutAll: ' --> ';
				nextPutAll: (self durationAsTime: (each newEnd));
				nextPutAll: String crlf.
			(each lines)
				do: [ :line | 
					stream
						nextPutAll: line;
						nextPutAll: String crlf ].
			stream
				nextPutAll: String crlf ].
	^ stream contents
]

{ #category : #printing }
Subtitles >> printOn: aStream [
	aStream nextPutAll: self file basename
]

{ #category : #conversion }
Subtitles >> scale: firstIndex to: newFirst and: lastIndex to: newLast [
	"self scale: 1 to: 2 minutes + 30 seconds and: 415 to: 1 hour + 33 minutes"

	| oldFirst oldLast scale |
	oldFirst := (self entries at: firstIndex) at: #start.
	oldLast := (self entries at: lastIndex) at: #start.
	scale := (newLast - newFirst) asMilliSeconds
			/ (oldLast - oldFirst) asMilliSeconds.
	self entries
		do: [ :each | 
			| newStart newEnd |
			newStart := (((each at: #start) - oldFirst) * scale + newFirst)
					asMilliSeconds milliseconds asDuration.
			newEnd := (((each at: #end) - oldFirst) * scale + newFirst) asMilliSeconds
					milliseconds asDuration.
			each at: #newStart put: newStart.
			each at: #newEnd put: newEnd ]
]

{ #category : #conversion }
Subtitles >> writeNewContents [
	self file parent / (self file basename replaceSuffix: '.srt' with: '-NEW.srt')
		writeStreamDo: [ :s | s nextPutAll: self newContents ]
]
