"
See the `Class Hierarchy update demo` page.

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
