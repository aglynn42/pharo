Extension { #name : #GlamourPresentationModel }

{ #category : #'*GT-Inspector' }
GlamourPresentationModel class >> exampleInspectorOn42 [
	<gtExample>
	"open an inspector on 42"
	^ self inspectorOn: 42
]

{ #category : #'*GT-Inspector' }
GlamourPresentationModel class >> exampleSimpleMethodsBrowser [
	<gtExample>
	"Open a Methods Browser on Object."
	|ui|
	ui := GlamourPresentationModel new.
	ui presentationClass: GTSimpleMethodsBrowser startOn: Object.
	^ ui openWithSpec
]

{ #category : #'*GT-Inspector' }
GlamourPresentationModel class >> inspectorOn: anObject [
	"Open an inspector on anObject. 
	Execute the following example:
	self inspectorOn: 42.
	self inspectorOn: self new."
	|ui|
	ui := GlamourPresentationModel new.
	ui presentationClass: GTInspector startOn: anObject.
	^ ui openWithSpec
]
