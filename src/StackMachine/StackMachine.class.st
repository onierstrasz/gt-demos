Class {
	#name : #StackMachine,
	#superclass : #CollectionValueHolder,
	#category : #StackMachine
}

{ #category : #accessing }
StackMachine >> add [
	self assert: value size >= 2 description: 'operation needs two arguments on the stack'.
	self push: self pop + self pop
]

{ #category : #accessing }
StackMachine >> add1and2 [
	<gtExample>
	| result |
	result := self pushed1and2.
	result add.
	self assert: result value size equals: 1.
	self assert: result top equals: 3.
	^ result 
]

{ #category : #accessing }
StackMachine >> empty [
	<gtExample>
	| result |
	result := StackMachine new.
	self assert: result isEmpty.
	^ result
]

{ #category : #accessing }
StackMachine >> initialize [

	value := OrderedCollection new
]

{ #category : #accessing }
StackMachine >> pop [
	self assert: value isNotEmpty description: 'stack is empty'.
	^ self removeLast
]

{ #category : #accessing }
StackMachine >> push1andPop [
	<gtExample>
	| result popped |
	result := self pushed1.
	popped := result pop.
	self assert: popped equals: 1.
	self assert: result isEmpty.
	^ result 
]

{ #category : #accessing }
StackMachine >> push: anObject [
	self addLast: anObject
]

{ #category : #accessing }
StackMachine >> pushed1 [
	<gtExample>
	| result |
	result := self empty.
	result push: 1.
	self assert: result size equals: 1.
	self assert: result top equals: 1.
	^ result 
]

{ #category : #accessing }
StackMachine >> pushed1and2 [
	<gtExample>
	| result |
	result := self pushed1.
	result push: 2.
	self assert: result value size equals: 2.
	self assert: result top equals: 2.
	^ result 
]

{ #category : #accessing }
StackMachine >> top [
	self assert: value isNotEmpty description: 'stack is empty'.
	^ value last
]
