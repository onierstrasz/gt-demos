Class {
	#name : #BaselineOfGtDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtDemos
}

{ #category : #baselines }
BaselineOfGtDemos >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #GtDemos;
				package: #'Tutorial-MemoryGame-Model';
				package: #'Tutorial-MemoryGame-UI'
				"; package: #'GtDemos-PostOffice'"
				"; package: #'GtDemos-BouncingAtoms'"
				
				 ]
]
