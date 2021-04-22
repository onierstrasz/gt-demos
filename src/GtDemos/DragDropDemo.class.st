Class {
	#name : #DragDropDemo,
	#superclass : #Object,
	#category : #'GtDemos-Bloc'
}

{ #category : #accessing }
DragDropDemo >> uglyDemo [
<gtExample>
"Demo showing how to let the blue guy be dropped omto (and into) the red guy."
| container redGuy blueGuy |
	container := BlElement new.
container size: 600@400.
container background: Color lightGray.

redGuy := BlElement new.
redGuy background: Color red.
redGuy padding: (BlInsets all: 5).
redGuy layout: BlLinearLayout horizontal.
redGuy addEventHandler: BlPullHandler new.
container addChild: redGuy.
redGuy relocate: 100@100.

blueGuy := BlElement new.
blueGuy background: Color blue.
blueGuy size: 20@20.
blueGuy addEventHandler: BlPullHandler new.
container addChild: blueGuy.
blueGuy relocate: 300@300.

blueGuy when: BlPullEndEvent do: [ : event |
	container
		withAllLeafChildrenAt: 
			( event currentTarget position )
		do: [ : each |
			each dispatchEvent:
				(BlDropEvent new
					source: blueGuy;
					yourself)
	]
 ].

redGuy
	when: BlDropEvent
	do: [ : event | | dropped |
		dropped := event source.
		dropped == redGuy 
		ifFalse: [ 
			dropped removeFromParent.
			redGuy addChild: dropped
		 ]
	].

^ container
]
