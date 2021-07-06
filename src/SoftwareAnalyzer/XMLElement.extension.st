Extension { #name : #XMLElement }

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> @ someNames [
	| r |
	r := self.
	someNames do: [ :n |
		r ifNil: [ ^ nil ].
		r := r elementAt: n ].
	^ r
]

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> getString [

	^ self nodes first asString
]

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> rawString [
	| result |
	result := OrderedCollection new.
	self rawStringIn: result.
	^ '' join: result
]

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> rawStringIn: result [
	"PRIVATE"
	self nodes do: [ :n | 
		n class ~~ XMLString
			ifTrue: [ n rawStringIn: result ]
			ifFalse: [ result add: n asString ] ].

]

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> searchFor: aName [
	"Recursively look for tags"
	| result |
	result := OrderedCollection new.
	self searchFor: aName in: result.
	^ result
]

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> searchFor: aName in: result [
	"PRIVATE"
	(self name = aName) ifTrue: [ result add: self ].
	self nodes do: [ :n | 
		(#(XMLString) includes: n class name)
			ifFalse: [ n searchFor: aName in: result ] ].

]

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> searchShallowFor: aName [
	"Look for tags without going into a recursion. Return all the tags that are directly below me"
	| result |
	result := OrderedCollection new.
	self searchShallowFor: aName in: result.
	^ result
]

{ #category : #'*SoftwareAnalyzer' }
XMLElement >> searchShallowFor: aName in: result [
	"PRIVATE"
	self nodes select: [ :n | n class == XMLElement ] thenDo: [ :n | 
		(n name = aName) ifTrue: [ result add: n ] ].
]
