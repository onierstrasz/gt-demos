Class {
	#name : #GtHomeGtDemos,
	#superclass : #GtHomeSection,
	#category : #'GtDemos-Sections'
}

{ #category : #accessing }
GtHomeGtDemos >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'GtDemos').
	cardsContainer := self newCardsContainer.
		
	cardsContainer addChild: (self
		newHeaderCardWithTitle: 'Oscar''s GT Demos'
		description: 'Oscar''s GT Demos'
		size: 200@150
		content:
			(BrLabel new
				text: 'Oscar''s GT Demos';
				aptitude: BrGlamorousLabelAptitude new
					bold;
				padding: (BlInsets all: 20)) asScalableElement
		action: [ :card | 
			| database startPage |
			database := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase 
				databaseNamed: 'onierstrasz/gt-demos/lepiter'.
			startPage := database pageNamed: 'Oscar''s GT Demos'.
			GtWorldUtility 
				showSpaceWithTitle: startPage title
				inPagerWith: [ startPage
					asLepiterPagePhlowTool asElementDo: [ :e | e ] ] asStencil
				from: card ]).
			
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
