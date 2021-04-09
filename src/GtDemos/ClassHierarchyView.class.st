"
Shows how to have an automatically updating gtView.

Create the class ==Dummy==:

[[[
Object subclass: #Dummy.
]]]

Open a class hierarchy view on that class:

[[[]
ClassHierarchyView new forClass: Dummy.
]]]

Create a subclass and see the view update:

[[[]
Dummy subclass: #Foo
]]]

Remove ==Foo== and ==Dummy== to update the view again:
[[[]
Foo removeFromSystem
]]]

[[[
Dummy removeFromSystem
]]]

The magic is in the ${method:name=ClassHierarchyView>>#gtLiveFor:}$ method which updates when classes are added or removed.


"
Class {
	#name : #ClassHierarchyView,
	#superclass : #Object,
	#instVars : [
		'class',
		'clazz'
	],
	#category : #'GtDemos-GtMondrian'
}

{ #category : #accessing }
ClassHierarchyView >> clazz [
	^ clazz
]

{ #category : #accessing }
ClassHierarchyView >> forClass: aClass [
	clazz := aClass
]

{ #category : #accessing }
ClassHierarchyView >> gtLiveFor: aView [
	<gtView>
	| v |
	v := aView mondrian.
	^ v
		title: 'Live';
		priority: 10;
		painting: [ :m | v initialize: self hierarchy ];
		updateWhen: ClassAdded in: SystemAnnouncer uniqueInstance;
		updateWhen: ClassRemoved in: SystemAnnouncer uniqueInstance
]

{ #category : #accessing }
ClassHierarchyView >> hierarchy [
	^ GtMondrianDomainExamples new
		classHierarchyFor: self clazz withAllSubclasses
]
