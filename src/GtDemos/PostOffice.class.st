"
PostOffice gtExamples collect: [:each | each run returnValue]

"
Class {
	#name : #PostOffice,
	#superclass : #Object,
	#instVars : [
		'queue'
	],
	#category : #'GtDemos-PostOffice'
}

{ #category : #examples }
PostOffice >> emptyPostOffice [
	<gtExample>
	| po |
	po := PostOffice new.
	self assert: po isEmpty.
	^ po
]

{ #category : #actions }
PostOffice >> enqueue: aCustomer [
	queue addLast: aCustomer
]

{ #category : #initialization }
PostOffice >> initialize [
	queue := OrderedCollection new
]

{ #category : #testing }
PostOffice >> isEmpty [
	^ queue isEmpty
]

{ #category : #examples }
PostOffice >> postOfficeWithJack [
	<gtExample>
	| po |
	po := self emptyPostOffice.
	(Customer named: 'Jack') enters: po.
	self assert: po waiting equals: 1.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJackAndJill [
	<gtExample>
	| po |
	po := self postOfficeWithJack.
	(Customer named: 'Jill') enters: po.
	self assert: po waiting equals: 2.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJackAndJillServed [
	<gtExample>
	| po |
	po := self postOfficeWithJackServed.
	self assert: po serveCustomer name equals: 'Jill'.
	self assert: po waiting equals: 0.
	self assert: po serveCustomer isNil.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJackServed [
	<gtExample>
	| po |
	po := self postOfficeWithJackAndJill.
	self assert: po serveCustomer name equals: 'Jack'.
	self assert: po waiting equals: 1.
	^ po
]

{ #category : #printing }
PostOffice >> printOn: aStream [
	super printOn: aStream.
	queue printElementsOn: aStream
]

{ #category : #actions }
PostOffice >> serveCustomer [
	^ queue ifEmpty: [ nil ] ifNotEmpty: [ queue removeFirst ]
]

{ #category : #querying }
PostOffice >> waiting [
	^ queue size
]
