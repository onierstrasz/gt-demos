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

{ #category : #accessing }
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

{ #category : #accessing }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingHappensBySendingMessages:);
		  pageNamed: 'Everything happens by sending messages' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> everythingIsAnObject: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingIsAnObject:);
		  pageNamed: 'Everything is an object' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> imageChanges: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.70;
		  priority: (self priorityFor: #imageChanges:);
		  newText: 'To be expanded:
Original pure OOPL
First windowing system and IDE';
		  element: [ 
			  GtFilePictureLiveSlide new fileReference:
					  (GtResourcesUtility resourceAtPath:
							   'onierstrasz/gt-demos/images/image+changes.png') ]
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> messages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #messages:);
		  pageNamed: 'Three kinds of messages' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> outline: aSlide [
	<gtSlide>
	^ aSlide paragraph
		  priority: (self priorityFor: #outline:);
		  subtitle: 'Outline';
		  paragraph: '
• Background: What''s Smalltalk?
• Basics: syntax, sending messages
• Programming in the Playground
• Programming classes and methods in the Coder
• ...
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
		imageChanges:
		twoRules:
		everythingIsAnObject:
		everythingHappensBySendingMessages:
		syntax:
		messages:
		scriptingInThePlayground:
		programmingClassesAndMethods:
		bouncingAtoms:
		worldExampleSlideFor:
		)
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> priorityFor: aSlideMethodSelector [
	^ self priorities indexOf: aSlideMethodSelector
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> programmingClassesAndMethods: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #programmingClassesAndMethods:);
		  pageNamed: 'Programming Classes and Methods' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> scriptingInThePlayground: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #scriptingInThePlayground:);
		  pageNamed: 'Scripting in the Playground' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> slides [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		outline:
		smalltalk80:
		twoRules:
		syntax:
		messages:
		bouncingAtoms:
		)
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> smalltalk80: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.70;
		  priority: (self priorityFor: #smalltalk80:);
		  newText: 'To be expanded:
Original pure OOPL
First windowing system and IDE';
		  element: [ 
			  GtFilePictureLiveSlide new fileReference:
					  (GtResourcesUtility resourceAtPath:
							   'onierstrasz/gt-demos/images/smalltalk-80.png') ]
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> syntax: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #syntax:);
		  pageNamed: 'Smalltalk Syntax' from: self dbName
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

{ #category : #accessing }
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

{ #category : #accessing }
SmalltalkIntroSlideshow >> worldExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide world
		  priority: (self priorityFor: #worldExampleSlideFor:)
]
