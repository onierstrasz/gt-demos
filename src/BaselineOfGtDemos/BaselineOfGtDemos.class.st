Class {
	#name : #BaselineOfGtDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtDemos
}

{ #category : #accessing }
BaselineOfGtDemos class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase
		                     properties.
	currentProperties addRegisteredDirectory:
		FileLocator imageDirectory 
			/ 'pharo-local' 
			/ 'iceberg'
			/ 'onierstrasz' 
			/ 'gt-demos' 
			/ 'lepiter'.

	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baselines }
BaselineOfGtDemos >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #GtDemos;
				package: #'StackMachine';
				package: #'Tutorial-MemoryGame-Model';
				package: #'Tutorial-MemoryGame-UI'
				 ]
]
