"
Slideshow for the P2 Smalltalk lecture planned for 2022-05-20.

```
SmalltalkIntroSlideshow show
```

"
Class {
	#name : #SmalltalkIntroSlideshow,
	#superclass : #Object,
	#category : #'GtDemos-Slideshows'
}

{ #category : #accessing }
SmalltalkIntroSlideshow class >> show [
	GtLiveShow openInSpace: SmalltalkIntroSlideshow
]

{ #category : #slides }
SmalltalkIntroSlideshow >> bouncingAtoms: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #bouncingAtoms:);
		  pageNamed: 'Bouncing atoms demo' from: self dbName;
		  yourself
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> dbName [
	^ 'onierstrasz/gt-demos/lepiter'
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingHappensBySendingMessages:);
		  pageNamed: 'Everything happens by sending messages' from: self dbName
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingIsAnObject: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingIsAnObject:);
		  pageNamed: 'Everything is an object' from: self dbName
]

{ #category : #slides }
SmalltalkIntroSlideshow >> gtWorld: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.60;
		  priority: (self priorityFor: #gtWorld:);
		  newTextWithFormat: ('Glamorous Toolkit is a “moldable” development environment with native windows, software analysis support, and a visualization engine. Gt is built on top of Pharo, a modern, open-source Smalltalk.' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ aSlide world ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> imageChanges: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.50;
		  priority: (self priorityFor: #imageChanges:);
		  newTextWithFormat: ('Smalltalk is a live programming system. Objects live inside an image running on a VM. Changes to classes and methods are logged as you program.' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ 
			  GtFilePictureLiveSlide new fileReference:
					  (GtResourcesUtility resourceAtPath:
							   'onierstrasz/gt-demos/images/image+changes.png') ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> messages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #messages:);
		  pageNamed: 'Three kinds of messages' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> methodSyntax: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  priority: (self priorityFor: #methodSyntax:);
		  newTextWithFormat: self methodSyntaxExplanation;
		  element: [ self methodSyntaxWithLinks ];
		  elementWeight: 0.6
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> methodSyntaxExplanation [

	"Adapted from GtCoderSlideshow"

	| text |
	text := 'PLACEHOLDER TO BE FIXED

Also, if a method is annotated with the ' asRopedText
	        , ('gtExample' asRopedText glamorousExplanationFor: #gtView)
	        ,
		        ' pragma, the coder offers you additional buttons similar to the ones in the playground.'
			        asRopedText.

	^ text asRopedText
		  glamorousRegularFont;
		  fontSize: 20
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> methodSyntaxWithLinks [
	"Adapted from GtCoderSlideshow"
	<gtExample>
	| classCoderElement pragmaTarget inspectTarget evaluateTarget debugTarget aScripter expandedMethodElement buttonsList |
	
	classCoderElement := (GtInspector createOn:(GtPharoBehaviorCoder forClass: GtABAddressBookExample)) maximized.
	
	aScripter := BlDevScripter new.
	aScripter element: classCoderElement.

	aScripter click
		label: 'Expand first method';
		id: GtSourceCoderId index: 1;
		play.

	classCoderElement := aScripter elementWithoutParent.

	expandedMethodElement := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: BrInfiniteListElement]
		ifFound: [:aChild | aChild childAt: 1].
	pragmaTarget := expandedMethodElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = '<gtExample>' asString]]
		ifFound: [:aChild | aChild].
	buttonsList := expandedMethodElement
		allChildrenBreadthFirstSelect: [:aChild | aChild isKindOf: BrButton].

	evaluateTarget := expandedMethodElement childNamed: GtMethodCoderPlayExampleActionId.
	inspectTarget := expandedMethodElement childNamed: GtMethodCoderPlayAndInspectExampleActionId.
	debugTarget := expandedMethodElement childNamed: GtMethodCoderDebugExampleActionId.

	pragmaTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #gtView)
					relocate:
						(2 @ pragmaTarget extent y / 2)).
	evaluateTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #evaluateButton)
					relocate:
						(2 @ evaluateTarget extent y / 2)).
	inspectTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #inspectButton)
					relocate:
						(2 @ inspectTarget extent y / 2)).
	debugTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #debugButton)
					relocate:
						(2 @ debugTarget extent y / 2)).
	
	^ classCoderElement.
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> outline: aSlide [

	<gtSlide>
	^ aSlide paragraph
		  priority: (self priorityFor: #outline:);
		  subtitle: 'Outline';
		  paragraph: '
 
• Background — What is Smalltalk?
• Basics — syntax, sending messages
• Scripting in the Playground
• Live programming of classes and methods
• GT use cases
'
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> priorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		outline:
		smalltalk80:
		gtWorld:
		imageChanges:
		twoRules:
		everythingIsAnObject:
		everythingHappensBySendingMessages:
		syntax:
		methodSyntax:
		messages:
		scriptingInThePlayground:
		programmingClassesAndMethods:
		bouncingAtoms:

		)
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> priorityFor: aSlideMethodSelector [
	^ self priorities indexOf: aSlideMethodSelector
]

{ #category : #slides }
SmalltalkIntroSlideshow >> programmingClassesAndMethods: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #programmingClassesAndMethods:);
		  pageNamed: 'Programming Classes and Methods' from: self dbName
]

{ #category : #slides }
SmalltalkIntroSlideshow >> scriptingInThePlayground: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #scriptingInThePlayground:);
		  pageNamed: 'Scripting in the Playground' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> smalltalk80: aSlide [

	"In the late 60s, Alan Kay predicted that in the foreseeable future handheld multimedia computers would become affordable. He called this a “Dynabook”. (The photo shows a mockup, not a real computer.)
He reasoned that such systems would need to be based on object from the ground up, so he set up a lab at the Xerox Palo Alto Research Center (PARC) to develop such a fully object-oriented system, including both software and hardware. They developed the first graphical workstations with windowing system and mouse."

	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.60;
		  priority: (self priorityFor: #smalltalk80:);
		  newTextWithFormat: ('Smalltalk was the first purely object-oriented language and environment, with the first interactive, graphical IDE.' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ 
			  GtFilePictureLiveSlide new fileReference:
				  (GtResourcesUtility resourceAtPath:
					   'onierstrasz/gt-demos/images/smalltalk-80.png') ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntax: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #syntax:);
		  pageNamed: 'Smalltalk Syntax (the funny bits)' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		  priority: (self priorityFor: #titleSlideFor:);
		  titleWithFormat: ('A little bit of Smalltalk' asRopedText
				   fontSize: 70;
				   glamorousRegularFont)
]

{ #category : #slides }
SmalltalkIntroSlideshow >> twoRules: aSlide [
	<gtSlide>
	^ aSlide paragraph
		  priority: (self priorityFor: #twoRules:);
		  subtitle: 'Two rules';
		  paragraph: '
		  
1. Everything is an object

2. Everything happens by sending messages
'
]

{ #category : #slides }
SmalltalkIntroSlideshow >> worldExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide world
		  priority: (self priorityFor: #worldExampleSlideFor:)
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> yellowExplanationTargetCircleFor: aModel [
	"Copied from GtCoderSlideshow"
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: aModel).
]
