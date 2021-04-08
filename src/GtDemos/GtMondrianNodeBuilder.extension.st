Extension { #name : #GtMondrianNodeBuilder }

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> background: aColor [
	| stencil |
	stencil := self stencil.
	self
		shape:
			[ :anObject :anElement | stencil cull: anObject cull: (anElement background: aColor) ]
]

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> defaultStencil [
	^ [ :model | self defaultNodeElement ]
]

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> ellipse [
	self ellipse: [ :n :e | e ]
]

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> margin: aNumber [
	| stencil |
	stencil := self stencil.
	self
		shape: [ :anObject :anElement | 
			stencil
				cull: anObject
				cull: (anElement margin: (BlInsets all: aNumber)) ]
]

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> onClick: aBlock [
	| stencil |
	stencil := self stencil.
	self
		shape: [ :anObject :anElement | 
			stencil
				cull: anObject
				cull:
					(anElement
						when: BlClickEvent
						do:
							[ :anEvent | aBlock cull: anObject cull: anEvent ]) ]
]

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> size: aPoint [
	| stencil |
	stencil := self stencil.
	self
		shape:
			[ :anObject :anElement | stencil cull: anObject cull: (anElement size: aPoint) ]
]

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> stencil [
	^ self elementStencilBuilder ifNil: [ self defaultStencil ]
]

{ #category : #'*GtDemos' }
GtMondrianNodeBuilder >> tooltip [
	| stencil |
	stencil := self stencil.
	self
		shape: [ :anObject :anElement | 
			stencil
				cull: anObject
				cull:
					(anElement
						aptitude: (BrGlamorousWithLabelTooltipAptitude new text: anObject printString)) ]
]
