Class {
	#name : #CTIdentityHashTableTest,
	#superclass : #TestCase,
	#instVars : [
		'table',
		'testsize'
	],
	#category : #'Containers-HashTable-Tests-SUnit'
}

{ #category : #running }
CTIdentityHashTableTest >> setUp [
	super setUp.
	table := CTIdentityHashTable new.
	testsize := 100.
]

{ #category : #testing }
CTIdentityHashTableTest >> testAddAndModifyString [
	| key value |
	key := String newFrom: 'testme!'.
	value := 1.
	table at: key put: value.
	
	self assert: (table at: key) = value.
	
	key at: 1 put: $x.
	
	self assert: (table at: key) = value
	
]

{ #category : #testing }
CTIdentityHashTableTest >> testAddEqualStrings [
	| key1 key2 value1 value2 |
	key1 := String newFrom: 'testme!'.
	key2 := String newFrom: 'testme!'.
	
	self assert: key1 ~~ key2.
	
	value1 := 1.
	value2 := 2.
	
	table at: key1 put: value1.
	table at: key2 put: value2.
	
	self assert: (table at: key1) = value1.
	self assert: (table at: key2) = value2.
	
	
]

{ #category : #testing }
CTIdentityHashTableTest >> testAddSymbol [
	0 to: testsize do: [ :each |
		self assert: table size = each.
		table at: each asString asSymbol put: each ].
	0 to: testsize do: [ :each |
		self assert: (table at: each asString asSymbol ) = each ].
]

{ #category : #testing }
CTIdentityHashTableTest >> testRemoveSymbol [
	0 to: testsize do: [ :each |
		self assert: table size = each.
		table at: each asString asSymbol put: each ].
	
	0 to: testsize by: 2 do: [ :each |
		self assert: (table includesKey: each asString asSymbol).
		table removeKey: each asString asSymbol.
		self deny: (table includesKey: each asString asSymbol) ].
	
	1 to: testsize by: 2 do: [ :each |
		self assert: (table at: each asString asSymbol) = each ].
]
