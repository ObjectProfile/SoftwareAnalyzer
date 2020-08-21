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
