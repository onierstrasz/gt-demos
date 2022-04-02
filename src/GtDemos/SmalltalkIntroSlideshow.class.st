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
SmalltalkIntroSlideshow >> dbName [
	^ 'onierstrasz/gt-demos/lepiter'
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> messages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #messages:);
		  pageNamed: 'Three kinds of messages' from: self dbName
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> priorityFor: aSlideMethodSelector [
	^ self slides indexOf: aSlideMethodSelector
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> slides [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		syntax:
		messages:
		)
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
