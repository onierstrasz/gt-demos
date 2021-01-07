Class {
	#name : #Customer,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'GtDemos-PostOffice'
}

{ #category : #'instance creation' }
Customer class >> named: aString [
	^ self new name: aString
]

{ #category : #actions }
Customer >> enters: aPostOffice [
	aPostOffice enqueue: self
]

{ #category : #accessing }
Customer >> name [
	^ name
]

{ #category : #accessing }
Customer >> name: aString [
	name := aString
]

{ #category : #printing }
Customer >> printOn: aStream [
	self name printOn: aStream
]
