Class {
	#name : #SAJExample,
	#superclass : #Object,
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #examples }
SAJExample >> exampleArgoUmlSPL [

	"Source code from: https://bitbucket.org/easelab/faxe/src/master/ "

	<script: 'self new exampleArgoUmlSPL inspect'>
	| m fr |
	m := SAJModel new.
	m rootFilename:
		'/Users/alexandrebergel/Dropbox/GitRepos/argouml-spl-benchmark'.
	fr := '/Users/alexandrebergel/Dropbox/GitRepos/argouml-spl-benchmark/xml'
		      asFileReference.
	(fr children) do: [ :ffr | m addSrcMLXML: ffr contents ].
"	m importFeaturesHierarchy: ('/Users/alexandrebergel/Dropbox/GitRepos/faxe/_.feature-model' asFileReference contents)."
	m importFeaturesAsCSV: m getFeatureListFromSourceCodeUsingArgoUmlSPL.
	m build.
	"m visualizeFeatureInteraction open."
	^ m
]

{ #category : #examples }
SAJExample >> exampleDSpot [

	"Source code from: https://bitbucket.org/easelab/datasetbitcoinwallet/src/master/ "

	<script: 'self new exampleDSpot inspect'>
	| m fr answer |
	m := SAJModel new.
	m rootFilename:
		'/Users/alexandrebergel/Desktop/DSPOT_DS/'.
	fr := '/Users/alexandrebergel/Desktop/DSPOT_DS/'
		      asFileReference.
	
	(fr allChildren select: [ :fffr | fffr fullName endsWith: '.xml' ]) do: [ :ffr | m addSrcMLXML: ffr contents ].
	m build.
	"m visualizeFeatureInteraction open."
	

answer := WriteStream on: String new.
answer nextPutAll: 'Classname,Number of methods,Number of test methods,NumberOfAssertions,Number of Statements in the tests'.
answer crlf.
(m units reject: #isStub) do: [ :unit |
	answer nextPutAll: unit name.
	answer nextPutAll: ','.
	answer nextPutAll: unit numberOfMethods asString.
	answer nextPutAll: ','.
	answer nextPutAll: unit numberOfTestMethods asString.
	answer nextPutAll: ','.
	answer nextPutAll: unit numberOfAssertions asString.
	answer nextPutAll: ','.
	answer nextPutAll: (unit methodTests collect: #numberOfStatements) sumPossiblyEmpty asString.
	answer crlf.
].
^ answer contents
]

{ #category : #examples }
SAJExample >> exampleEolian [

	"Source code from: https://bitbucket.org/easelab/datasetbitcoinwallet/src/master/ "

	<script: 'self new exampleEolian inspect'>
	| m fr |
	m := SAJModel new.
	m rootFilename:
		'/tmp/E/Eolian-Telemetria-Auriga'.
	fr := '/tmp/E/Eolian-Telemetria-Auriga/xml'
		      asFileReference.
	fr children do: [ :ffr | m addSrcMLXML: ffr contents ].
	m build.
	"m visualizeFeatureInteraction open."
	^ m
]

{ #category : #examples }
SAJExample >> exampleFAXE [

	"Source code from: https://bitbucket.org/easelab/faxe/src/master/ "

	<script: 'self new exampleFAXE inspect'>
	| m fr |
	m := SAJModel new.
	m rootFilename:
		'/Users/alexandrebergel/Dropbox/GitRepos/faxe/src/main'.
	fr := '/Users/alexandrebergel/Dropbox/GitRepos/faxe/src/main/xml'
		      asFileReference.
	(fr children select: [ :f | f basename endsWith: '.xml' ]) do: [ :ffr | m addSrcMLXML: ffr contents ].
	m importFeaturesHierarchy: ('/Users/alexandrebergel/Dropbox/GitRepos/faxe/_.feature-model' asFileReference contents).
	m importFeaturesAsCSV: m getFeatureListFromSourceCode.

	m build.
	^ m
]

{ #category : #examples }
SAJExample >> exampleFAXEOLD [

	"Source code from: https://bitbucket.org/easelab/faxe/src/master/ "

	<script: 'self new exampleFAXE inspect'>
	| m fr |
	m := SAJModel new.
	m rootFilename:
		'/Users/alexandrebergel/Dropbox/GitRepos/faxe'.
	fr := '/Users/alexandrebergel/Dropbox/GitRepos/faxe/xml'
		      asFileReference.
	(fr children select: [ :f | f basename endsWith: '.xml' ]) do: [ :ffr | m addSrcMLXML: ffr contents ].
	m importFeaturesHierarchy: ('/Users/alexandrebergel/Dropbox/GitRepos/faxe/_.feature-model' asFileReference contents).
	m importFeaturesAsCSV: m getFeatureListFromSourceCode.
	m build.
	"m visualizeFeatureInteraction open."
	^ m
]

{ #category : #examples }
SAJExample >> exampleSimple [
	<script: 'self new exampleSimple inspect'>
	| m |
	m := SAJModel new.
	m addSrcMLXML: SAJTest new sourceCodeExampleXML.
	m build.
	^ m
]

{ #category : #examples }
SAJExample >> exampleWallet [

	"Source code from: https://bitbucket.org/easelab/faxe/src/master/ "

	<script: 'self new exampleWallet inspect'>
	| m fr |
	m := SAJModel new.
	m rootFilename:
		'/Users/alexandrebergel/Dropbox/GitRepos/datasetbitcoinwallet'.
	fr := '/Users/alexandrebergel/Dropbox/GitRepos/datasetbitcoinwallet/xml'
		      asFileReference.
	(fr children select: [ :f | f basename endsWith: '.xml' ]) do: [ :ffr | m addSrcMLXML: ffr contents ].
	m importFeaturesHierarchy: ('/Users/alexandrebergel/Dropbox/GitRepos/datasetbitcoinwallet/src/de/schildbach/wallet/_.feature-model' asFileReference contents).
	m importFeaturesAsCSV: m getFeatureListFromSourceCode.

	m build.
	^ m
]

{ #category : #examples }
SAJExample >> exampleWalletOLD [

	"Source code from: https://bitbucket.org/easelab/datasetbitcoinwallet/src/master/ "

	<script: 'self new exampleWallet inspect'>
	| m fr |
	m := SAJModel new.
	m rootFilename:
		'/Users/alexandrebergel/Dropbox/GitRepos/datasetbitcoinwallet/src'.
	fr := '/Users/alexandrebergel/Dropbox/GitRepos/datasetbitcoinwallet/src/xml'
		      asFileReference.
	fr children do: [ :ffr | m addSrcMLXML: ffr contents ].
	m importFeaturesAsCSV: SAJTest new featureAnnotations.

	m importFeaturesHierarchy: self featureHierarchyWallet.

	m build.
	"m visualizeFeatureInteraction open."
	^ m
]

{ #category : #examples }
SAJExample >> featureHierarchyWallet [

	^ 'BitcoinWallet
    BitCoins
        Denomination
            BTC8dp
            BTC6dp
            BTC4dp
            mBTC
            uBTC
        Currency
            Calculator
            ExchangeRate
                Search
                Rate
                SetDefault
        TradeCoins
            TradeMethod
                NFC
                QRCode
                URL
                Email
                CloudStorage
                WebpageFileDownload
            SendCoins
                AutoCloseSendDialog
                EmptyWallet
                Fee
                    Economic
                    Normal
                    Priority
            SweepPaperWallet
            RequestCoins
                ShareRequest
                FromLocalApp
                CopyRequest
                NotifyOnReceive
            DonateCoins
            Codecs
                base58
                BIP21
                BIP70
                BIP72
                TBIP75
        BitcoinBalance
        BalanceReminder
    Wallet
        Diagnostics
            ShowXPub
            ResetBlockChain
            IssueReporter
                DeviceInfo
                AppLog
                WalletDump
                InstalledPackages
        Peers
            AddressBook
                OwnAddress
                SenderAddresses
            OwnName
            TrustedPeer
            SkipPeerDiscovery
            BlockExplorer
                Blochchain
                Blocktrail
                Blockcypher
            NetworkMonitor
        Connectvity
            ConnectvityIndicator
            DataUsage
            Bluetooth
        Security
            Backup
            Restore
            SpendingPIN
            ShowDisclaimer
            BackupReminder
            DustSpamProtection
    BlockchainSync
    ViewTransactions
        ViewAll
        ViewSent
        ViewReceived
    Localisation'
]
