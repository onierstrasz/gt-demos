"
Slideshow for the P2 Smalltalk lecture planned for 2022-05-20.

```
P2Slideshow show
```

"
Class {
	#name : #P2Slideshow,
	#superclass : #Object,
	#category : #'GtDemos-Slideshows'
}

{ #category : #accessing }
P2Slideshow class >> show [
	GtLiveShow openInSpace: P2Slideshow
]

{ #category : #accessing }
P2Slideshow >> dbName [
	^ 'onierstrasz/gt-demos/lepiter'
]

{ #category : #accessing }
P2Slideshow >> testLepiterPageSlideFor: aSlide [

	<gtSlide>
		^ aSlide lepiterPage
		priority: 27;
		pageNamed: 'gt-demos' from: self dbName
	
]

{ #category : #accessing }
P2Slideshow >> titleSlideFor: aSlide [

	<gtSlide>
	^ aSlide title
		  priority: 1;
		  titleWithFormat: ('A little bit of Smalltalk' asRopedText
				   fontSize: 70;
				   glamorousRegularFont)
]
