Class {
	#name : #GtHomeGtDemos,
	#superclass : #GtHomeMultiCardSection,
	#category : #'GtDemos-Sections'
}

{ #category : #accessing }
GtHomeGtDemos >> sectionTitle [
	^ 'Oscar''s GT Demos'
]

{ #category : #accessing }
GtHomeGtDemos >> todoCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard page
		title: 'Oscar''s GT Demos';
		description: 'Oscar''s GT Demos';
		priority: 10;
		pageName: 'Oscar''s GT Demos';
		databaseName: 'onierstrasz/gt-demos/lepiter';
		assertInvariant;
		yourself
]
