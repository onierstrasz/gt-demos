"
Demos how to create an interactive prime sieve with Mondrian.

```
PrimeSieve new demo
```

Actually this is intended to show that creating such a demo is rather clunky with GtMondrian, and that a higher-level builder interface would be welcome.

You can also set the maximum value, and simulate a user clicking on the nodes in order:

```
PrimeSieve new maxValue: 100; primesClicked
```

"
Class {
	#name : #PrimeSieve,
	#superclass : #Object,
	#instVars : [
		'maxValue'
	],
	#category : #'GtDemos-GtMondrian'
}

{ #category : #accessing }
PrimeSieve >> clickAll [
	<gtExample>
	| view nodes |
	view := self demo.
	view root children
		do: [ :node | node dispatchEvent: BlClickEvent new ].
	^ view
]

{ #category : #accessing }
PrimeSieve >> demo [
	"Generates a 1000 node grid. If you click on a white node, it will turn blue
	and its multiple turn grey. A grey node no longer reacts to a click.
	The first node only turns grey. Clicking white nodes in order will produce prime sieve."

	<gtExample>
	| view |
	view := GtMondrian new.
	view nodes
		shape: [ :n | 
			BlElement new
				border: (BlBorder paint: Color black);
				background: Color white;
				geometry: BlEllipseGeometry new;
				margin: (BlInsets all: 5);
				aptitude: (BrGlamorousWithLabelTooltipAptitude new text: n);
				when: BlClickEvent
					do: [ :anEvent | 
					| elt multiples |
					elt := anEvent target.
					n = 1
						ifTrue: [ elt background: Color lightGray ]
						ifFalse: [ elt background paint color ~= Color lightGray
								ifTrue: [ elt background: Color lightBlue.
									multiples := view root children
										select: [ :ea | ea graph model \\ n = 0 ].
									multiples allButFirst
										do: [ :ea | ea background: Color lightGray ] ] ] ] ];
		with: (1 to: self maxValue).
	view layout grid.
	^ view
]

{ #category : #accessing }
PrimeSieve >> demoDSL [
	"This version uses extension methods of GtMondrianNodeBuilder to raise the interface to a slightly higher level."

	<gtExample>
	| view |
	view := GtMondrian new.
	view nodes
		ellipse;
		background: Color white;
		size: 50 @ 50;
		margin: 5;
		tooltip;
		onClick: [ :n :anEvent | 
			| elt multiples |
			elt := anEvent target.
			n = 1
				ifTrue: [ elt background: Color lightGray ]
				ifFalse: [ elt background paint color ~= Color lightGray
						ifTrue: [ elt background: Color lightBlue.
							multiples := view root graph allNodeChildren
								select: [ :ea | ea graph model \\ n = 0 ].
							multiples allButFirst
								do: [ :ea | ea background: Color lightGray ] ] ] ];
		with: (1 to: self maxValue).
	view layout grid.
	^ view
]

{ #category : #accessing }
PrimeSieve >> initialize [
	maxValue := 1000
]

{ #category : #accessing }
PrimeSieve >> maxValue [
	^ maxValue
]

{ #category : #accessing }
PrimeSieve >> maxValue: anInteger [
	maxValue := anInteger
]

{ #category : #accessing }
PrimeSieve >> primesClicked [
	"Simulate a user clicking all the white nodes in sequence."

	<gtExample>
	| view nodes |
	view := self demo.
	nodes := view root children asArray asOrderedCollection.
	[ (Delay forSeconds: 2) wait.
	[ nodes notEmpty ]
		whileTrue: [ | node |
			node := nodes removeFirst.
			node background paint color = Color white
				ifTrue: [ (Delay forMilliseconds: 100) wait.
					node dispatchEvent: BlClickEvent new ] ] ] fork.
	^ view
]
