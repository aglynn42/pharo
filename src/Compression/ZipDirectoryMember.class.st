"
ZipFileMember instances represent directories inside ZipArchives.
They don't do much other than hold names and permissions (and extra fields).

You can add files in subdirectories to a ZipArchive without using any ZipDirectoryMembers.
"
Class {
	#name : #ZipDirectoryMember,
	#superclass : #ZipFileMember,
	#category : #Compression-Archives
}

{ #category : #'instance creation' }
ZipDirectoryMember class >> newNamed: aFileName [
	^(self new) localFileName: aFileName; yourself
]

{ #category : #private }
ZipDirectoryMember >> asDirectory [
	^self
]

{ #category : #accessing }
ZipDirectoryMember >> desiredCompressionMethod: aNumber [
]

{ #category : #initialization }
ZipDirectoryMember >> initialize [
	super initialize.
	externalFileAttributes := self mapPermissionsFromUnix: DefaultDirectoryPermissions.
	super desiredCompressionMethod: CompressionStored.
]

{ #category : #testing }
ZipDirectoryMember >> isDirectory [
	^true
]

{ #category : #accessing }
ZipDirectoryMember >> localFileName: aString [

	| file |
	file := aString asFileReference.	
	super localFileName: (file basename copyWith: $/).
	file exists ifFalse: [ ^ self ].
	self modifiedAt: file entry modificationTime.
]

{ #category : #private }
ZipDirectoryMember >> rewindData [
]

{ #category : #testing }
ZipDirectoryMember >> usesFileNamed: aName [
	^false
]

{ #category : #private-writing }
ZipDirectoryMember >> writeDataTo: aStream [
       "Write nothing. Directories have no contents to write."
]
