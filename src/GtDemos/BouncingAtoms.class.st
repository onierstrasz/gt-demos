"
I extend ${class:name=BlExampleBouncingAtomsElement}$ to offer a demo more suitable for running in an inspector pane.

[[[
BouncingAtoms demo 
]]]

Open a new Inspetor window.
Inspect the children and select a random one.
Set its background color to blue (self background: Color blue).
Query and set its velocity to 0@0 and 20@20, and its size to 10@10.

"
Class {
	#name : #BouncingAtoms,
	#superclass : #BlExampleBouncingAtomsElement,
	#category : #'GtDemos-BouncingAtoms'
}

{ #category : #accessing }
BouncingAtoms class >> defaultExtent [
^ 300@200
]

{ #category : #accessing }
BouncingAtoms class >> demo [
	<script: 'self demo'>
	^ self new
		initializeWith: 300
		ofSize: 5 @ 5
		within: self defaultExtent
]

{ #category : #accessing }
BouncingAtoms >> initialize [
	super initialize.
	self
		background: Color lightGreen;
		border: (BlBorder paint: Color green width: 1)
]

{ #category : #accessing }
BouncingAtoms >> step [
	"Bounce those atoms!"

	| r |
	r := self measuredBounds topLeft corner: self bounds extent - (8 @ 7).
	self childrenDo: [ :m | m bounceIn: r ]
]
