Class {
	#name : #SAJExample,
	#superclass : #Object,
	#category : #'SoftwareAnalyzer-Java'
}

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
