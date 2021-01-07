"
[[[
PostOffice gtExamples collect: [:each | each run returnValue]
]]]
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
	(Customer named: 'jack') enters: po.
	self assert: po waiting equals: 1.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJackAndJane [
	<gtExample>
	| po |
	po := self postOfficeWithJack.
	(Customer named: 'jane') enters: po.
	self assert: po waiting equals: 2.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJackAndJaneAndJill [
	<gtExample>
	| po |
	po := self postOfficeWithJackAndJane.
	(Customer named: 'jill') enters: po.
	self assert: po waiting equals: 3.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJackServed [
	<gtExample>
	| po |
	po := self postOfficeWithJackAndJaneAndJill.
	self assert: po serveCustomer name equals: 'jack'.
	self assert: po waiting equals: 2.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJaneServed [
	<gtExample>
	| po |
	po := self postOfficeWithJackServed.
	self assert: po serveCustomer name equals: 'jane'.
	self assert: po waiting equals: 1.
	^ po
]

{ #category : #examples }
PostOffice >> postOfficeWithJillServed [
	<gtExample>
	| po |
	po := self postOfficeWithJaneServed.
	self assert: po serveCustomer name equals: 'jill'.
	self assert: po waiting equals: 0.
	self assert: po serveCustomer isNil.
	^ po
]

{ #category : #printing }
PostOffice >> printOn: aStream [
	'aPostOffice' printOn: aStream.
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
