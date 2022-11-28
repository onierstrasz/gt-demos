"
Slideshow for the P2 Smalltalk lecture planned for 2022-05-20.

```
SmalltalkIntroSlideshow show
```

"
Class {
	#name : #OLDSmalltalkIntroSlideshow,
	#superclass : #Object,
	#category : #'GtDemos-Slideshows'
}

{ #category : #accessing }
OLDSmalltalkIntroSlideshow class >> show [
	GtLiveShow openInSpace: OLDSmalltalkIntroSlideshow
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> addTargetCircleFor: aTarget named: aSymbol [

	aTarget addChild:
		((self yellowExplanationTargetCircleFor: aSymbol) relocate:
			 2 @ aTarget extent y / 2 )
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> addingAutoPlay: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #addingAutoPlay:);
		pageNamed: 'Changing a running system' from: self myLepiterDB;
		yourself
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> bouncingAtoms: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #bouncingAtoms:);
		  pageNamed: 'Changing a running system on the fly' from: self dbName;
		  yourself
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> composingExamples: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #composingExamples:);
		pageNamed: 'Composing (Test) Examples' from: self myLepiterDB;
		yourself
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> dbName [
	^ 'onierstrasz/gt-demos/lepiter'
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> everythingHappensBySendingMessages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingHappensBySendingMessages:);
		  pageNamed: 'Everything happens by sending messages' from: self dbName
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> everythingIsAnObject: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingIsAnObject:);
		  pageNamed: 'Everything is an object' from: self dbName
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> exploringLudo: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #exploringLudo:);
		pageNamed: 'Exploring a live system' from: self myLepiterDB;
		yourself
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> findTargetWithText: aText in: expandedMethodElement [
	^ expandedMethodElement
		  allChildrenBreadthFirstDetect: [ :aChild | 
			  (aChild isKindOf: BrTextElementWithCursors) and: [ 
				  aChild text asString = aText asString ] ]
		  ifFound: [ :aChild | aChild ]
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> gtWorld: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.6;
		  priority: (self priorityFor: #gtWorld:);
		  newTextWithFormat: ('Glamorous Toolkit is a “moldable” development environment with native windows, software analysis tools, and a visualization engine. 
Gt is built on top of Pharo, a modern, open-source Smalltalk.' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ aSlide world ]
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> imageChanges: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.50;
		  priority: (self priorityFor: #imageChanges:);
		  newTextWithFormat: ('Smalltalk is a live programming system.
Objects live inside an image running on a VM. 
Changes to classes and methods are logged as you program.' asRopedText
				   glamorousRegularFont;
				   fontSize: 40);
		  element: [ 
			  GtFilePictureLiveSlide new fileReference:
					  (GtResourcesUtility resourceAtPath:
							   'onierstrasz/gt-demos/images/image+changes.png') ]
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> liveDocumentationLogic: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #liveDocumentationLogic:);
		pageNamed: 'Live documentation of the game logic' from: self myLepiterDB;
		yourself
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> liveDocumentationUML: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #liveDocumentationUML:);
		pageNamed: 'Live documentation of the technical solution' from: self myLepiterDB;
		yourself
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> ludoAppetizer: aSlide [
	<gtSlide>
	
	^ (aSlide textAndElement)
		elementWeight: 0.5;
		priority: (self priorityFor: #ludoAppetizer:);
		newTextWithFormat: (self asHeader: 'Appetizer') bold,(self asText: '
Ludo as a running example of a live system');
		element: [ GtLudoGame new asElement asScalableElement ]
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> messages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #messages:);
		  pageNamed: 'Three kinds of messages' from: self dbName
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> methodSyntax: aSlide [

	"Methods start with a declaration of the message selector and arguments. Temporaries must be declared. Statements are separate by periods. The caret (^) is special syntax for returning a result."

	<gtSlide>
	^ aSlide textAndElement
		  priority: (self priorityFor: #methodSyntax:);
		  newTextWithFormat: ('Method syntax
' asRopedText bold;
				   glamorousRegularFont;
				   fontSize: 40) , ('Note the special syntax for variable declarations (|...|), statement separators (period) and returns (^).' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ 
			  GtPharoSyntaxExplainer new forMethod:
				  BlElementVectorGeometry >> #containsPoint:in:on: ];
		  elementWeight: 0.6
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> outline: aSlide [

	<gtSlide>
	^ aSlide paragraph
		  priority: (self priorityFor: #outline:);
		  subtitleWithFormat: ('Outline' asRopedText
				   bold;
				   fontSize: 40;
				   glamorousRegularFont);
		  paragraph: '
• Background — What is Smalltalk?
• Basics — syntax, sending messages
• Scripting in the Playground
• Live programming of classes and methods
• GT use cases
'
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> picturesDirectoryPath [
	^ Path * 'feenkcom' / 'gtoolkit-demos' / 'data' / 'images'
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> priorities [
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
		messages:
		methodSyntax:
		bouncingAtoms:
		scriptingInThePlayground:
		programmingClassesAndMethods:
		)
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> priorityFor: aSlideMethodSelector [
	^ self priorities indexOf: aSlideMethodSelector
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> programmingClassesAndMethods: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #programmingClassesAndMethods:);
		  pageNamed: 'Programming Classes and Methods' from: self dbName
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> recordingMoves: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #recordingMoves:);
		pageNamed: 'Recording and visualizing token moves' from: self myLepiterDB;
		yourself
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> scriptingInThePlayground: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #scriptingInThePlayground:);
		  pageNamed: 'Scripting in the Playground' from: self dbName
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		ludoAppetizer:
		outline:
		smalltalk80:
		gtWorld:
		imageChanges:
		twoRules:
		everythingIsAnObject:
		everythingHappensBySendingMessages:
		threeKindsOfMessages:
		syntax:
		methodSyntax:
		exploringLudo:
		addingAutoPlay:
		composingExamples:
		recordingMoves:
		liveDocumentationLogic:
		liveDocumentationUML:
		takeHome:
		whatsNext:
		)
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> smalltalk80: aSlide [

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
OLDSmalltalkIntroSlideshow >> syntax: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #syntax:);
		  pageNamed: 'Smalltalk Syntax (the funny bits)' from: self dbName
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> takeHome: aSlide [

	<gtSlide>
	
	^ (aSlide paragraph)
		priority: (self priorityFor: #takeHome:);
		subtitleWithFormat: (self asSubtitle: 'Take home messages');
		paragraphWithFormat:
				(self
						asText:
							'

• Smalltalk enables '), (self asText: 'live programming') italic, (self asText: '

• Example methods enable '), (self asText: 'composable tests') italic, (self asText: ' and live interaction with test results

• '), (self asText: 'Moldable development') italic, (self asText: ' brings together coding and exploration of live systems 
')
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> threeKindsOfMessages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #threeKindsOfMessages:);
		  pageNamed: 'Three kinds of messages' from: self myLepiterDB
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		  priority: (self priorityFor: #titleSlideFor:);
		  titleBottomPadding: 30;
		  titleWithFormat: ('A bit of Smalltalk' asRopedText
				   fontSize: 70;
				   bold;
				   glamorousRegularFont);
		  subtitleWithFormat: ('@onierstrasz' asRopedText
				   fontSize: 40;
				   glamorousRegularFont)
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> twoRules: aSlide [

	<gtSlide>
	^ aSlide paragraph
		  priority: (self priorityFor: #twoRules:);
		  subtitleWithFormat: ('Two rules' asRopedText
				   bold;
				   fontSize: 40;
				   glamorousRegularFont);
		  paragraph: '

1. Everything is an object

2. Everything happens by sending messages
'
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> whatsNext: aSlide [
	<gtSlide>
	
	^ (aSlide paragraph)
		priority: (self priorityFor: #whatsNext:);
		subtitleWithFormat: (self asSubtitle: 'What''s next?');
		paragraphWithFormat:
				(self
						asText:
							'

• Download GT from gtoolkit.com

• Explore the Glamorous Toolkit Book

• Learn about Pharo — go to books.pharo.org

• Have fun!
')
]

{ #category : #slides }
OLDSmalltalkIntroSlideshow >> worldExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide world
		  priority: (self priorityFor: #worldExampleSlideFor:)
]

{ #category : #accessing }
OLDSmalltalkIntroSlideshow >> yellowExplanationTargetCircleFor: aModel [
	"Copied from GtCoderSlideshow"
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: aModel).
]
