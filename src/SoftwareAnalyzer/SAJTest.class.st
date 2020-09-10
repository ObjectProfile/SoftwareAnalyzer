Class {
	#name : #SAJTest,
	#superclass : #TestCase,
	#instVars : [
		'm',
		'empty'
	],
	#category : #'SoftwareAnalyzer-Java'
}

{ #category : #'code example' }
SAJTest >> featureAnnotations [
	^ 'fileName,lineRange,featureName,annotationGranualarity
src\de\schildbach\wallet\Configuration.java,47-47,Denomination,LINE
src\de\schildbach\wallet\Configuration.java,50-50,AutoCloseSendDialog,LINE
src\de\schildbach\wallet\Configuration.java,52-52,ConnectivityIndicator,LINE
src\de\schildbach\wallet\Configuration.java,54-54,ExchangeRates,LINE
src\de\schildbach\wallet\Configuration.java,56-57,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\Configuration.java,60-60,BlockExplorer,LINE
src\de\schildbach\wallet\Configuration.java,62-62,DataUsage,LINE
src\de\schildbach\wallet\Configuration.java,64-64,BalanceReminder,LINE
src\de\schildbach\wallet\Configuration.java,66-66,ShowDisclaimer,LINE
src\de\schildbach\wallet\Configuration.java,72-75,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\Configuration.java,79-80,BackupReminder,FRAGMENT
src\de\schildbach\wallet\Configuration.java,83-83,Bluetooth,LINE
src\de\schildbach\wallet\Configuration.java,86-87,Denomination,FRAGMENT
src\de\schildbach\wallet\Configuration.java,100-144,Denomination,FRAGMENT
src\de\schildbach\wallet\Configuration.java,148-150,OwnName,FRAGMENT
src\de\schildbach\wallet\Configuration.java,154-156,AutoCloseSendDialog,FRAGMENT
src\de\schildbach\wallet\Configuration.java,160-162,ConnectivityIndicator,FRAGMENT
src\de\schildbach\wallet\Configuration.java,166-172,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\Configuration.java,176-179,BlockExplorer,FRAGMENT
src\de\schildbach\wallet\Configuration.java,183-189,BalanceReminder,FRAGMENT
src\de\schildbach\wallet\Configuration.java,193-208,BackupReminder,FRAGMENT
src\de\schildbach\wallet\Configuration.java,212-214,ShowDisclaimer,FRAGMENT
src\de\schildbach\wallet\Configuration.java,218-224,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\Configuration.java,260-260,Log,FRAGMENT
src\de\schildbach\wallet\Configuration.java,274-302,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\Configuration.java,318-321,Bluetooth,FRAGMENT
src\de\schildbach\wallet\Constants.java,54-55,BlockChainSync,FRAGMENT
src\de\schildbach\wallet\Constants.java,58-59,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\Constants.java,62-63,SweepPaperWallets,FRAGMENT
src\de\schildbach\wallet\Constants.java,66-67,BlockExplorer,FRAGMENT
src\de\schildbach\wallet\Constants.java,81-102,BackupWallet,FRAGMENT
src\de\schildbach\wallet\Constants.java,82-85,Codecs,FRAGMENT
src\de\schildbach\wallet\Constants.java,83-84,base58,FRAGMENT
src\de\schildbach\wallet\Constants.java,112-113,Fee,FRAGMENT
src\de\schildbach\wallet\Constants.java,121-122,BackupWallet,FRAGMENT
src\de\schildbach\wallet\Constants.java,132-133,Fee,FRAGMENT
src\de\schildbach\wallet\Constants.java,140-141,BackupWallet,FRAGMENT
src\de\schildbach\wallet\Constants.java,151-152,SetDefault,FRAGMENT
src\de\schildbach\wallet\Constants.java,156-158,DonateCoins,FRAGMENT
src\de\schildbach\wallet\Constants.java,162-169,IssueReporter,FRAGMENT
src\de\schildbach\wallet\Constants.java,192-193,SkipDiscovery,FRAGMENT
src\de\schildbach\wallet\Constants.java,203-206,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\Constants.java,217-217,NotifyReceived,LINE
src\de\schildbach\wallet\Logging.java,34-96,AppLog,FRAGMENT
src\de\schildbach\wallet\WalletApplication.java,127-129,Bluetooth,FRAGMENT
src\de\schildbach\wallet\WalletApplication.java,196-207,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\WalletApplication.java,223-223,BackupWallet,LINE
src\de\schildbach\wallet\WalletApplication.java,228-228,BackupReminder,LINE
src\de\schildbach\wallet\WalletApplication.java,270-270,ResetBlockChain,LINE
src\de\schildbach\wallet\WalletApplication.java,280-280,BackupWallet,LINE
src\de\schildbach\wallet\WalletApplication.java,289-298,BackupWallet,FRAGMENT
src\de\schildbach\wallet\WalletApplication.java,290-291,Codecs,FRAGMENT
src\de\schildbach\wallet\WalletApplication.java,291-291,base58,LINE
src\de\schildbach\wallet\WalletApplication.java,309-315,NotifyReceived,FRAGMENT
src\de\schildbach\wallet\WalletApplication.java,335-335,BlockchainSync,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,52-204,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,67-68,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,88-89,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,97-97,ExchangeRates,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,105-107,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,117-117,ExchangeRates,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,121-121,ExchangeRates,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,128-128,ExchangeRates,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,132-132,Denomination,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,138-148,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,169-169,RequestCoins,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,171-173,SendCoins,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,173-173,QRCode,LINE
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,180-181,RequestCoins,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,184-189,SendCoins,FRAGMENT
src\de\schildbach\wallet\WalletBalanceWidgetProvider.java,187-188,QRCode,FRAGMENT
src\de\schildbach\wallet\data\AddressBookDao.java,30-52,AddressBook,FRAGMENT
src\de\schildbach\wallet\data\AddressBookEntry.java,30-64,AddressBook,FRAGMENT
src\de\schildbach\wallet\data\AppDatabase.java,28-60,AddressBook,FRAGMENT
src\de\schildbach\wallet\data\ConfigFormatLiveData.java,43-43,Denomination,LINE
src\de\schildbach\wallet\data\ConfigFormatLiveData.java,54-55,Denomination,FRAGMENT
src\de\schildbach\wallet\data\ConfigOwnNameLiveData.java,27-54,OwnName,FRAGMENT
src\de\schildbach\wallet\data\DynamicFeeLiveData.java,58-209,Fee,FRAGMENT
src\de\schildbach\wallet\data\DynamicFeeLiveData.java,115-121,Priority,FRAGMENT
src\de\schildbach\wallet\data\DynamicFeeLiveData.java,124-129,Economic,FRAGMENT
src\de\schildbach\wallet\data\ExchangeRate.java,23--1,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\data\ExchangeRatesProvider.java,58-293,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\data\ExchangeRatesProvider.java,185-191,SetDefault,FRAGMENT
src\de\schildbach\wallet\data\ExchangeRatesProvider.java,196-202,SetDefault,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,54-59,Codecs,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,56-57,BIP21,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,57-57,BIP70,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,159-160,PaymentURL,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,167-171,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,177-368,PaymentURL,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,181-192,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,183-238,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,191-284,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,196-196,PaymentURL,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,212-213,Codecs,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,213-213,base58,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,228-228,Bluetooth,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,230-388,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,234-235,Codecs,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,235-235,BIP21,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,279-464,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,343-347,Codecs,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,344-346,BIP70,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,351--1,PaymentURL,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,357-357,Bluetooth,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,365-367,Bluetooth,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,372-510,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,378-378,Bluetooth,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,392-413,Codecs,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,404-408,BIP21,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,407-407,RequestCoins,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,451-451,PaymentURL,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,457-562,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,493-493,PaymentURL,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,503--1,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\PaymentIntent.java,543-543,PaymentURL,LINE
src\de\schildbach\wallet\data\PaymentIntent.java,554--1,RequestCoins,FRAGMENT
src\de\schildbach\wallet\data\SelectedExchangeRateLiveData.java,30-76,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\data\WalletBalanceLiveData.java,39-130,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\data\WalletBalanceLiveData.java,126-127,Denomination,FRAGMENT
src\de\schildbach\wallet\offline\AcceptBluetoothService.java,51-195,Bluetooth,FRAGMENT
src\de\schildbach\wallet\offline\AcceptBluetoothService.java,141-141,BlockchainSync,LINE
src\de\schildbach\wallet\offline\AcceptBluetoothThread.java,41-157,Bluetooth,FRAGMENT
src\de\schildbach\wallet\offline\AcceptBluetoothThread.java,102-107,Codecs,FRAGMENT
src\de\schildbach\wallet\offline\AcceptBluetoothThread.java,103-106,BIP70,FRAGMENT
src\de\schildbach\wallet\offline\DirectPaymentTask.java,86-146,RequestCoins,FRAGMENT
src\de\schildbach\wallet\offline\DirectPaymentTask.java,150-206,Bluetooth,FRAGMENT
src\de\schildbach\wallet\offline\DirectPaymentTask.java,177-178,Codecs,FRAGMENT
src\de\schildbach\wallet\offline\DirectPaymentTask.java,178-178,BIP70,LINE
src\de\schildbach\wallet\service\BlockchainService.java,119-119,AddressBook,LINE
src\de\schildbach\wallet\service\BlockchainService.java,141-141,ResetBlockChain,LINE
src\de\schildbach\wallet\service\BlockchainService.java,158-159,ResetBlockChain,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,162-164,BlockchainSync,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,209-213,ResetBlockChain,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,217-222,BlockchainSync,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,249-258,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,264--1,NotifyReceived,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,272-272,Denomination,LINE
src\de\schildbach\wallet\service\BlockchainService.java,293-294,Codecs,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,294-294,base58,LINE
src\de\schildbach\wallet\service\BlockchainService.java,297-297,AddressBook,LINE
src\de\schildbach\wallet\service\BlockchainService.java,317-327,AddressBook,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,319-320,Codecs,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,320-320,base58,LINE
src\de\schildbach\wallet\service\BlockchainService.java,335--1,NotifyReceived,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,368-369,ConnectivityIndicator,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,381-396,ConnectivityIndicator,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,428-428,BlockchainSync,LINE
src\de\schildbach\wallet\service\BlockchainService.java,539-539,AddressBook,LINE
src\de\schildbach\wallet\service\BlockchainService.java,547-567,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,549-566,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,714-721,BlockChainSync,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,730-738,BlockChainSync,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,752-756,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,759-760,SkipDiscovery,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,765-765,SkipDiscovery,LINE
src\de\schildbach\wallet\service\BlockchainService.java,776-790,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,808-811,BlockChainSync,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,823-823,BlockChainSync,LINE
src\de\schildbach\wallet\service\BlockchainService.java,850-854,ResetBlockChain,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,857-868,BlockchainSync,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,886-886,BlockChainSync,LINE
src\de\schildbach\wallet\service\BlockchainService.java,910-913,ResetBlockChain,FRAGMENT
src\de\schildbach\wallet\service\BlockchainService.java,983-989,BlockchainSync,FRAGMENT
src\de\schildbach\wallet\service\BlockchainState.java,40-42,BlockchainSync,FRAGMENT
src\de\schildbach\wallet\service\BootstrapReceiver.java,57-59,BalanceReminder,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,63-63,DonateCoins,LINE
src\de\schildbach\wallet\service\InactivityNotificationService.java,101-118,DonateCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,104-128,DonateCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,109-164,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,117-137,DonateCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,122-122,Denomination,LINE
src\de\schildbach\wallet\service\InactivityNotificationService.java,127-160,DonateCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,136-192,DonateCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,150--1,DonateCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,175-175,BitcoinBalance,LINE
src\de\schildbach\wallet\service\InactivityNotificationService.java,180--1,DonateCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,182-182,BitcoinBalance,LINE
src\de\schildbach\wallet\service\InactivityNotificationService.java,184-188,SendCoins,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,185-187,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\service\InactivityNotificationService.java,186-186,Fee,LINE
src\de\schildbach\wallet\ui\AddressAndLabel.java,48-49,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\AddressAndLabel.java,49-49,base58,LINE
src\de\schildbach\wallet\ui\AddressAndLabel.java,74-75,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\AddressAndLabel.java,75-75,base58,LINE
src\de\schildbach\wallet\ui\AddressAndLabel.java,93-94,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\AddressAndLabel.java,94-94,base58,LINE
src\de\schildbach\wallet\ui\AddressAndLabel.java,113-114,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\AddressAndLabel.java,114-114,base58,LINE
src\de\schildbach\wallet\ui\AddressBookActivity.java,35-171,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\AlertDialogsFragment.java,210-220,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\AlertDialogsFragment.java,332-352,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\CurrencyCalculatorLink.java,32-220,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\CurrencyCalculatorLink.java,42-43,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\CurrencyCalculatorLink.java,105-113,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\CurrencyCalculatorLink.java,121-135,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\CurrencyCalculatorLink.java,147-182,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,44-176,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,55-56,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,56-56,base58,LINE
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,76-77,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,77-77,base58,LINE
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,102-103,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,103-103,base58,LINE
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,110-111,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,111-111,base58,LINE
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,144-145,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,145-145,base58,LINE
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,149-150,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,150-150,base58,LINE
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,154-155,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\EditAddressBookEntryFragment.java,155-155,base58,LINE
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,76-80,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,101-101,SetPIN,LINE
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,136-146,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,184-189,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,208-220,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,232-242,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,252-281,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,260--1,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,269-269,SetPIN,LINE
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,279--1,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,300-300,BackupWallet,LINE
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,321--1,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\EncryptKeysDialogFragment.java,378--1,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesActivity.java,25-35,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,47-180,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,52-70,SetDefault,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,53-53,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,62-66,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,78-78,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,82-89,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,111-112,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,139-141,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesAdapter.java,176-176,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,63-98,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,82-82,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,94-311,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,102-106,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,143-155,SetDefault,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,169-174,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,210-210,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,222-227,SetDefault,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,235-268,Search,FRAGMENT
src\de\schildbach\wallet\ui\ExchangeRatesFragment.java,276-277,Denomination,FRAGMENT
src\de\schildbach\wallet\ui\InputParser.java,83-83,QRCode,LINE
src\de\schildbach\wallet\ui\InputParser.java,115-116,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\InputParser.java,132-132,base58,LINE
src\de\schildbach\wallet\ui\InputParser.java,136-136,base58,LINE
src\de\schildbach\wallet\ui\InputParser.java,141-141,base58,LINE
src\de\schildbach\wallet\ui\InputParser.java,297-297,PaymentURL,LINE
src\de\schildbach\wallet\ui\InputParser.java,302-303,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\InputParser.java,303-303,TBIP75,LINE
src\de\schildbach\wallet\ui\InputParser.java,307-317,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\InputParser.java,308-312,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\InputParser.java,309-309,BIP70,LINE
src\de\schildbach\wallet\ui\InputParser.java,312-312,TBIP75,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,51-258,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,59-59,DeviceInfo,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,61-61,InstalledPackages,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,63-63,AppLog,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,65-65,WalletDump,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,82-82,DeviceInfo,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,84-85,InstalledPackages,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,88-88,AppLog,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,90-90,WalletDump,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,141-151,DeviceInfo,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,155-162,InstalledPackages,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,166-173,AppLog,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,177-194,WalletDump,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,241-244,DeviceInfo,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogBuilder.java,253-256,WalletDump,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,63-338,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,133-138,AppLog,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,149-154,DeviceInfo,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,163-166,WalletDump,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,196-257,AppLog,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,219-223,BackupReminder,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,277-316,DeviceInfo,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,313-313,Bluetooth,LINE
src\de\schildbach\wallet\ui\ReportIssueDialogFragment.java,320-326,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\ReportIssueViewModel.java,27-39,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsActivity.java,27-60,RequestCoins,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,75-454,RequestCoins,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,84-85,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,88-89,NFC,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,93-94,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,97-97,Bluetooth,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,100-100,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,103-103,Bluetooth,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,105-105,SenderAddress,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,119-119,Bluetooth,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,121-121,NFC,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,131-136,SenderAddress,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,139-152,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,155-169,NFC,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,160-161,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,178-186,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,183-183,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,200-206,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,210-213,Denomination,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,221-221,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,224-244,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,257-259,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,258-258,ExchangeRates,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,268-281,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,279-279,Bluetooth,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,285-287,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,296-297,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,297-297,ExchangeRates,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,304-304,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,316-329,SenderAddress,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,325-326,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,326-326,base58,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,333-361,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,374-374,CopyRequest,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,384-386,CopyRequest,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,394-396,LocalApp,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,404-409,CopyRequest,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,423-442,LocalApp,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,425-425,SendCoins,LINE
src\de\schildbach\wallet\ui\RequestCoinsFragment.java,446-452,NFC,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,47-244,RequestCoins,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,53-53,SenderAddress,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,55-55,OwnName,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,57-57,ExchangeRates,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,60-60,Bluetooth,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,67-68,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,72-158,SenderAddress,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,77-77,OwnName,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,79-79,ExchangeRate,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,81-108,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,88-93,OwnName,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,102-107,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,117-122,OwnName,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,131-136,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,145-150,OwnName,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,162-175,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,164-164,SenderAddress,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,171-171,Bluetooth,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,180-180,SenderAddress,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,183-189,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,185-188,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,188-188,OwnName,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,196-196,SenderAddress,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,199-199,OwnName,LINE
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,204-211,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\RequestCoinsViewModel.java,215-242,SenderAddress,FRAGMENT
src\de\schildbach\wallet\ui\SendCoinsQrActivity.java,39-104,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\SendCoinsQrActivity.java,40-103,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\SendCoinsQrActivity.java,70-75,SweepPaperWallet,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,70-367,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,159-164,OwnAddress,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,235-235,OwnAddress,LINE
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,282-286,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,315-315,SendCoins,LINE
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,323-326,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,348-349,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesFragment.java,349-349,base58,LINE
src\de\schildbach\wallet\ui\SendingAddressesViewModel.java,47-123,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesViewModel.java,87-88,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\SendingAddressesViewModel.java,88-88,base58,LINE
src\de\schildbach\wallet\ui\ShowPasswordCheckListener.java,27-44,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,77-77,AddressBook,LINE
src\de\schildbach\wallet\ui\TransactionsAdapter.java,85-85,AddressBook,LINE
src\de\schildbach\wallet\ui\TransactionsAdapter.java,107-109,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,128-128,AddressBook,LINE
src\de\schildbach\wallet\ui\TransactionsAdapter.java,225-237,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,245-248,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,276-280,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,286-295,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,299-310,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,320-324,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,337-341,DustSpamProtection,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,411-412,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,416-418,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,479-483,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,549-552,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,585-873,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,639-652,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,648-650,BackupReminder,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,650-650,ShowDisclaimer,LINE
src\de\schildbach\wallet\ui\TransactionsAdapter.java,696-697,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,746-747,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,775-776,Fee,FRAGMENT
src\de\schildbach\wallet\ui\TransactionsAdapter.java,788-788,Fee,LINE
src\de\schildbach\wallet\ui\TransactionsAdapter.java,833-838,Fee,FRAGMENT
src\de\schildbach\wallet\ui\WalletActionsFragment.java,51-57,RequestCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActionsFragment.java,61-67,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActionsFragment.java,71-78,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,127-129,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,277-294,NFC,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,306-309,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,315-318,SweepPaperWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,355-356,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,359-359,SweepPaperWallet,LINE
src\de\schildbach\wallet\ui\WalletActivity.java,361-363,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,366-367,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,384-386,RequestCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,390-474,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,394--1,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,400-402,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,406-408,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,412-414,SweepPaperWallets,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,418-420,NetworkMonitor,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,424-426,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,430-432,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,452-454,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,466-468,RequestCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,472--1,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,485-487,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,491-493,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,501-504,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\WalletActivity.java,508-512,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressDialogFragment.java,84-89,ShareAddress,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressDialogFragment.java,86-86,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressDialogFragment.java,87-87,base58,LINE
src\de\schildbach\wallet\ui\WalletAddressDialogFragment.java,99-100,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressDialogFragment.java,113-121,ShareAddress,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressFragment.java,53-54,NFC,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressFragment.java,58-59,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressFragment.java,71-71,NFC,LINE
src\de\schildbach\wallet\ui\WalletAddressFragment.java,79-95,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressFragment.java,90-90,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressFragment.java,98-106,NFC,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressFragment.java,115-121,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,52-52,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,54-54,QRCode,LINE
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,62-62,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,64-77,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,71-76,OwnName,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,86-91,OwnName,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,96-107,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,103-103,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,114-114,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,160-160,SenderAddress,LINE
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,171-172,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressViewModel.java,179-180,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesAdapter.java,45-190,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,56-234,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,87-92,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,113-118,OwnName,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,145-145,BlockExplorer,LINE
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,153-154,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,154-154,base58,LINE
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,171-174,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,183-193,BlockExplorer,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,185-186,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,186-186,base58,LINE
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,217-221,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,219-219,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,226-227,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesFragment.java,227-227,base58,LINE
src\de\schildbach\wallet\ui\WalletAddressesViewModel.java,42-148,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletAddressesViewModel.java,48-48,IssueReporter,LINE
src\de\schildbach\wallet\ui\WalletAddressesViewModel.java,53-53,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressesViewModel.java,59-59,IssueReporter,LINE
src\de\schildbach\wallet\ui\WalletAddressesViewModel.java,64-64,OwnName,LINE
src\de\schildbach\wallet\ui\WalletAddressesViewModel.java,68-99,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,55-314,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,75-75,BlockchainSync,LINE
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,82-82,ExchangeRates,LINE
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,102-106,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,143-150,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,165-178,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,204-205,DonateCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,214-216,DonateCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,223-228,DonateCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,225-226,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,226-226,Fee,LINE
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,233-265,BlockchainSync,FRAGMENT
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,236-236,ExchangeRates,LINE
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,277-277,Denomination,LINE
src\de\schildbach\wallet\ui\WalletBalanceFragment.java,282-291,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\WalletDisclaimerFragment.java,49-164,ShowDisclaimer,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,78-78,AddressBook,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,88-88,TransactionsFilter,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,92-92,QRCode,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,103-103,AddressBook,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,108-249,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,124-124,ViewSent,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,126-126,ViewReceived,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,132-132,ViewAll,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,150-386,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,190-190,TransactionsFilter,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,201--1,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,205-207,ViewAll,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,210-212,ViewReceived,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,215-218,ViewSent,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,228-230,ViewAll,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,233-235,ViewReceived,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,238-240,ViewSent,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,261-261,TransactionsFilter,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,276-279,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,277-278,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,278-278,base58,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,294-295,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,298-299,Fee,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,302-302,BlockExplorer,LINE
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,312-314,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,318-320,Fee,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,324-326,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,330-340,BlockExplorer,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,348-350,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,354-357,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,361-376,IssueReporter,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,383--1,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,393-395,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsFragment.java,407-408,BackupReminder,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,59--1,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,64-68,ViewSent,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,65-67,ViewReceived,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,76-76,AddressBook,LINE
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,90-90,AddressBook,LINE
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,111-116,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,162-185,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,172-176,ViewSent,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,173-175,ViewReceived,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,230-230,ViewReceived,LINE
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,232-232,ViewSent,LINE
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,241-241,ViewSent,LINE
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,243-243,ViewReceived,LINE
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,261-288,ViewSent,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,262-287,ViewReceived,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,265-275,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\WalletTransactionsViewModel.java,320--1,TransactionsFilter,FRAGMENT
src\de\schildbach\wallet\ui\WalletViewModel.java,44-44,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\WalletViewModel.java,66-69,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\WalletViewModel.java,92-92,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,74-391,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,89-91,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,136-144,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,183-186,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,196-226,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,237-242,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,250-257,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,262-265,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,270-271,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,294-297,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,311-311,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\BackupWalletDialogFragment.java,326-327,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletViewModel.java,28-42,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\BackupWalletViewModel.java,35-35,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\ImportDialogButtonEnablerListener.java,35-35,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\ImportDialogButtonEnablerListener.java,39-44,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\ImportDialogButtonEnablerListener.java,72-77,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\ImportDialogButtonEnablerListener.java,86-88,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,76-473,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,94-94,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,137-137,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,149-150,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,154-154,BackupWallet,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,158-159,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,159-159,base58,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,162-163,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,171-171,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,178-178,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,187-187,BackupWallet,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,201-210,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,223-237,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,243-249,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,264-319,BackupWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,313-317,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,323-323,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,333-333,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,337-337,base58,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,356-366,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,357-365,base58,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletDialogFragment.java,412-412,ResetBlockChain,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalActivity.java,25-34,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,65-311,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,87-87,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,116-116,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,127-129,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,137-137,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,145-145,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,156-164,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,168-174,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,183-183,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,187-187,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,199-199,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,203-203,BackupWallet,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,207-207,SetPIN,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,211-212,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,212-212,base58,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletFromExternalDialogFragment.java,253-253,ResetBlockChain,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletViewModel.java,27-41,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\ui\backup\RestoreWalletViewModel.java,33-33,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\backup\RestoreWalletViewModel.java,39-39,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\monitor\BlockListAdapter.java,62-68,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\monitor\BlockListAdapter.java,84-84,AddressBook,LINE
src\de\schildbach\wallet\ui\monitor\BlockListAdapter.java,102-102,AddressBook,LINE
src\de\schildbach\wallet\ui\monitor\BlockListAdapter.java,123-123,AddressBook,LINE
src\de\schildbach\wallet\ui\monitor\BlockListAdapter.java,147-155,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\monitor\BlockListAdapter.java,239-240,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\monitor\BlockListAdapter.java,240-240,base58,LINE
src\de\schildbach\wallet\ui\monitor\BlockListFragment.java,102-102,AddressBook,LINE
src\de\schildbach\wallet\ui\monitor\BlockListFragment.java,124-124,AddressBook,LINE
src\de\schildbach\wallet\ui\monitor\BlockListFragment.java,193-199,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\monitor\BlockListFragment.java,197-197,Denomination,LINE
src\de\schildbach\wallet\ui\monitor\BlockListFragment.java,208-222,BlockExplorer,FRAGMENT
src\de\schildbach\wallet\ui\monitor\NetworkMonitorActivity.java,31-85,NetworkMonitor,FRAGMENT
src\de\schildbach\wallet\ui\preference\DiagnosticsFragment.java,49-49,ShowXPub,LINE
src\de\schildbach\wallet\ui\preference\DiagnosticsFragment.java,76-79,ShowXPub,FRAGMENT
src\de\schildbach\wallet\ui\preference\DiagnosticsFragment.java,95-95,ResetBlockChain,LINE
src\de\schildbach\wallet\ui\preference\DiagnosticsFragment.java,104-109,ShowXPub,FRAGMENT
src\de\schildbach\wallet\ui\preference\ExtendedPublicKeyFragment.java,40-108,ShowXPub,FRAGMENT
src\de\schildbach\wallet\ui\preference\ExtendedPublicKeyFragment.java,80-80,QRCode,LINE
src\de\schildbach\wallet\ui\preference\SettingsFragment.java,55-56,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\ui\preference\SettingsFragment.java,82-87,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\ui\preference\SettingsFragment.java,91-92,DataUsage,FRAGMENT
src\de\schildbach\wallet\ui\preference\SettingsFragment.java,96-96,TrustedPeer,LINE
src\de\schildbach\wallet\ui\preference\SettingsFragment.java,102-103,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\ui\preference\SettingsFragment.java,118-123,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\ui\preference\SettingsFragment.java,132-157,TrustedPeer,FRAGMENT
src\de\schildbach\wallet\ui\scan\ScanActivity.java,425-471,QRCode,FRAGMENT
src\de\schildbach\wallet\ui\send\DeriveKeyTask.java,53-53,SetPIN,LINE
src\de\schildbach\wallet\ui\send\DeriveKeyTask.java,63-65,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\DeriveKeyTask.java,78-78,SetPIN,LINE
src\de\schildbach\wallet\ui\send\FeeCategory.java,21-46,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\FeeCategory.java,26-29,Economic,FRAGMENT
src\de\schildbach\wallet\ui\send\FeeCategory.java,33-37,Normal,FRAGMENT
src\de\schildbach\wallet\ui\send\FeeCategory.java,41-44,Priority,FRAGMENT
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,88-90,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,129-133,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,137-137,Denomination,LINE
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,139-139,Fee,LINE
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,142-147,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,184-184,SetPIN,LINE
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,208-208,SetPIN,LINE
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,230-230,BackupWallet,LINE
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,234-234,SetPIN,LINE
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,265-272,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,291-293,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,301-302,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,308-308,SetPIN,LINE
src\de\schildbach\wallet\ui\send\MaintenanceDialogFragment.java,336-336,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,74-400,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,109-111,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,164-164,Priority,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,185-190,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,225-225,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,242-242,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,264-264,BackupWallet,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,268-268,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,295-295,BlockchainSync,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,303-310,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,316-318,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,326-326,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,331-331,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,335-335,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,338-338,Denomination,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,340-340,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RaiseFeeDialogFragment.java,346-346,SetPIN,LINE
src\de\schildbach\wallet\ui\send\RequestPaymentRequestTask.java,50-222,RequestCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\RequestPaymentRequestTask.java,135-200,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\RequestWalletBalanceTask.java,75-312,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\RequestWalletBalanceTask.java,167-168,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\send\RequestWalletBalanceTask.java,168-168,base58,LINE
src\de\schildbach\wallet\ui\send\SendCoinsActivity.java,38-100,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsActivity.java,44-44,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsActivity.java,48-48,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsActivity.java,52-55,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsActivity.java,65-71,DonateCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsActivity.java,66-70,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,127-1572,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,135-135,AddressBook,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,139-140,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,157-157,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,165-167,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,174-175,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,212-220,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,240-254,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,307-354,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,371-371,AddressBook,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,389-394,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,397-407,ExchangeRates,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,404-404,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,410-410,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,413-413,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,425-430,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,434-434,Bluetooth,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,448-457,NFC,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,501-504,Denomination,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,511-513,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,513-513,ExchangeRates,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,519-527,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,522-528,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,523-530,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,544-546,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,580-581,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,581-581,ExchangeRates,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,590-590,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,592-592,SetPIN,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,601-601,SetPIN,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,603-603,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,660-668,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,665-666,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,690-690,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,693-706,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,696-697,Economic,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,700-701,Normal,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,704-705,Priority,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,720-734,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,721-723,Economic,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,726-728,Normal,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,731-733,Priority,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,751-751,AddressBook,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,783-783,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,789-796,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,802-802,SetPIN,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,810-810,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,812-813,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,823-823,SetPIN,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,832-832,BackupWallet,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,836-836,SetPIN,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,850-850,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,856-856,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,860-862,EmptyWallet,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,862-862,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,865-865,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,868-869,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,869-869,ExchangeRates,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,874-894,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,879-879,Denomination,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,910-911,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,911-911,BIP70,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,922-922,BlockchainSync,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,931-932,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,932-932,BIP70,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,956-958,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,972-981,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,976-980,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,990-991,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,996-996,Denomination,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1028-1029,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1034-1043,EmptyWallet,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1059-1065,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1069-1077,EmptyWallet,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1071-1071,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1073-1073,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1096-1096,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1105-1107,EmptyWallet,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1107-1107,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1129-1129,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1132-1132,AddressBook,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1136-1136,Denomination,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1177-1184,AddressBook,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1179-1180,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1180-1180,base58,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1207-1208,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1213-1222,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1215-1218,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1242-1243,DustSpamProtection,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1250-1250,EmptyWallet,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1254-1275,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1259-1261,Economic,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1264-1266,Priority,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1269-1272,Normal,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1290-1290,AddressBook,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1309-1309,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1335-1339,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1344-1344,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1348-1349,CurrencyCalculator,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1352-1356,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1450-1455,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1464-1464,CurrencyCalculator,LINE
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1467-1472,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1468-1471,PaymentURL,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1486-1490,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1499-1534,Codecs,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1500-1533,BIP72,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsFragment.java,1564-1569,Bluetooth,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsOfflineTask.java,38-143,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsOfflineTask.java,113-113,EmptyWallet,LINE
src\de\schildbach\wallet\ui\send\SendCoinsOfflineTask.java,137-139,EmptyWallet,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,43-98,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,56-56,AddressBook,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,58-58,ExchangeRates,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,60-60,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,63-63,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,70-71,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,71-71,Normal,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,89-89,AddressBook,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,91-91,ExchangeRates,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,93-93,Fee,LINE
src\de\schildbach\wallet\ui\send\SendCoinsViewModel.java,96-96,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SweepWalletActivity.java,31-55,SweepPaperWallets,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,102-724,SweepPaperWallet,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,117-119,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,122-122,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,147-147,Fee,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,163-167,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,190-195,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,223-225,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,229-229,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,239-239,SendCoins,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,251-251,SendCoins,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,339-339,BitcoinBalance,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,397-427,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,443-444,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,449-454,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,466-542,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,553-553,Fee,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,555-555,Denomination,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,559-568,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,583-584,SetPIN,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,608-609,BitcoinBalance,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,609-609,Fee,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,612-628,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,648-652,Fee,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,650-650,EmptyWallet,LINE
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,656-707,SendCoins,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,676-681,EmptyWallet,FRAGMENT
src\de\schildbach\wallet\ui\send\SweepWalletFragment.java,689-689,SendCoins,LINE
src\de\schildbach\wallet\util\Base43.java,22-162,Codecs,FRAGMENT
src\de\schildbach\wallet\util\Bluetooth.java,32-117,Bluetooth,FRAGMENT
src\de\schildbach\wallet\util\Bluetooth.java,37-43,Codecs,FRAGMENT
src\de\schildbach\wallet\util\Bluetooth.java,38-42,BIP70,FRAGMENT
src\de\schildbach\wallet\util\CrashReporter.java,99-114,InstalledPackages,FRAGMENT
src\de\schildbach\wallet\util\Nfc.java,29-50,NFC,FRAGMENT
src\de\schildbach\wallet\util\Qr.java,42-123,QRCode,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,79-88,Codecs,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,80-87,base58,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,194-213,BackupWallet,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,217-284,RestoreWallet,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,219-219,BackupWallet,LINE
src\de\schildbach\wallet\util\WalletUtils.java,225-225,ResetBlockChain,LINE
src\de\schildbach\wallet\util\WalletUtils.java,227-227,BackupWallet,LINE
src\de\schildbach\wallet\util\WalletUtils.java,235-253,Codecs,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,236-252,base58,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,239-239,BackupWallet,LINE
src\de\schildbach\wallet\util\WalletUtils.java,273-283,Codecs,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,274-282,base58,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,294-295,Codecs,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,295-295,base58,LINE
src\de\schildbach\wallet\util\WalletUtils.java,319-320,BackupWallet,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,328-329,Codecs,FRAGMENT
src\de\schildbach\wallet\util\WalletUtils.java,329-329,base58,LINE
src\de\schildbach\wallet\util\WalletUtils.java,358-367,BackupWallet,FRAGMENT'
]

{ #category : #running }
SAJTest >> setUp [
	super setUp.

	empty := SAJModel new.
	m := SAJModel new.
	m addSrcMLXML: self sourceCodeExampleXML.
	
]

{ #category : #'code example' }
SAJTest >> sourceCodeExampleXML [
^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" revision="1.0.0">

<unit revision="1.0.0" language="Java" filename="Box.java" hash="de9d7b4e3f579771d1e1f1a520198653498e032b"><class><specifier>public</specifier> class <name>Box</name> <super_list><implements>implements <super><name>Shape</name></super></implements></super_list> <block>{ }</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="Canvas.java" hash="61fbdbb8343f88315ea0009e1c246d86d48b4aa9"><import>import <name><name>java</name><operator>.</operator><name>util</name><operator>.</operator><name>*</name></name>;</import>

<class><specifier>public</specifier> class <name>Canvas</name> <block>{
    <decl_stmt><decl><type><specifier>public</specifier> <name><name>List</name><argument_list type="generic">&lt;<argument><name>Shape</name></argument>&gt;</argument_list></name></type> <name>shapes</name> <init>= <expr><operator>new</operator> <call><name><name>ArrayList</name><argument_list type="generic">&lt;&gt;</argument_list></name><argument_list>()</argument_list></call></expr></init></decl>;</decl_stmt>

    <function><type><specifier>public</specifier> <name>void</name></type> <name>add</name><parameter_list>(<parameter><decl><type><name>Shape</name></type> <name>s</name></decl></parameter>)</parameter_list> <block>{<block_content>
	<expr_stmt><expr><call><name><name>shapes</name><operator>.</operator><name>add</name></name><argument_list>(<argument><expr><name>s</name></expr></argument>)</argument_list></call></expr>;</expr_stmt>
    </block_content>}</block></function>

    <function><type><specifier>public</specifier> <name>int</name></type> <name>numberOfShapes</name><parameter_list>()</parameter_list> <block>{<block_content>
	<return>return <expr><call><name><name>shapes</name><operator>.</operator><name>size</name></name><argument_list>()</argument_list></call></expr>;</return>
    </block_content>}</block></function>

    <function><type><specifier>public</specifier> <specifier>static</specifier> <name>void</name></type> <name>main</name><parameter_list>(<parameter><decl><type><name><name>String</name><index>[]</index></name></type> <name>args</name></decl></parameter>)</parameter_list> <block>{<block_content>
	<decl_stmt><decl><type><name>Canvas</name></type> <name>c</name> <init>= <expr><operator>new</operator> <call><name>Canvas</name><argument_list>()</argument_list></call></expr></init></decl>;</decl_stmt>
	<expr_stmt><expr><call><name><name>c</name><operator>.</operator><name>add</name></name><argument_list>(<argument><expr><operator>new</operator> <call><name>Box</name><argument_list>()</argument_list></call></expr></argument>)</argument_list></call></expr>;</expr_stmt>
	<expr_stmt><expr><call><name><name>c</name><operator>.</operator><name>add</name></name><argument_list>(<argument><expr><operator>new</operator> <call><name>Circle</name><argument_list>()</argument_list></call></expr></argument>)</argument_list></call></expr>;</expr_stmt>
	<expr_stmt><expr><call><name><name>System</name><operator>.</operator><name>out</name><operator>.</operator><name>println</name></name><argument_list>(<argument><expr><literal type="string">"Number of added shapes = "</literal> <operator>+</operator> <call><name><name>c</name><operator>.</operator><name>numberOfShapes</name></name><argument_list>()</argument_list></call></expr></argument>)</argument_list></call></expr>;</expr_stmt>
    </block_content>}</block></function>
	
}</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="Circle.java" hash="91c9425a39b2b0ca0dbda34b8dfa457d020cf3b4"><class><specifier>public</specifier> class <name>Circle</name> <super_list><implements>implements <super><name>Shape</name></super></implements></super_list> <block>{
}</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="ColoredCircle.java" hash="af09de788ea65cb5dbca223746caefb62fa6f882"><class><specifier>public</specifier> class <name>ColoredCircle</name> <super_list><extends>extends <super><name>Circle</name></super></extends></super_list> <block>{
}</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="Shape.java" hash="164b8db223193c1787e34763f3e20befb6ea8716"><interface><specifier>public</specifier> interface <name>Shape</name> <block>{
}</block></interface>
</unit>

</unit>
'
]

{ #category : #'code example' }
SAJTest >> sourceCodeWithPackages [
"
package p1;

class C {
    public void foo() {
    }
}

--------

package p2;

import p1.*;

public class D { }

"
	^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" revision="1.0.0">

<unit revision="1.0.0" language="Java" filename="C.java" hash="d9bc752ee4352206ed501a8ffd9a17117cf27328"><package>package <name>p1</name>;</package>

<class>class <name>C</name> <block>{
    <function><type><specifier>public</specifier> <name>void</name></type> <name>foo</name><parameter_list>()</parameter_list> <block>{<block_content>
    </block_content>}</block></function>
}</block></class>
</unit>

<unit revision="1.0.0" language="Java" filename="D.java" hash="bf72cff3626f289315b7c94a102ac9f77bdc9923"><package>package <name>p2</name>;</package>

<import>import <name><name>p1</name><operator>.</operator><name>*</name></name>;</import>

<class><specifier>public</specifier> class <name>D</name> <block>{ }</block></class>
</unit>

</unit>
'
]

{ #category : #'tests - coree' }
SAJTest >> testBasic [
	self assert: m numberOfClasses equals: 4.
	self assert: m numberOfInterfaces equals: 1.

	self assert: ((m classes collect: #name) includesAll:
			 #( 'Box' 'Circle' 'Canvas' 'ColoredCircle' )).

	self assert: ((m interfaces collect: #name) includesAll:
			 #( 'Shape' )).
			
	self assert: m numberOfPackages equals: 0.
]

{ #category : #'tests - coree' }
SAJTest >> testEmpty [
	self assert: empty numberOfClasses equals: 0.
	self assert: empty numberOfInterfaces equals: 0
]

{ #category : #'tests - features' }
SAJTest >> testFeatures [

	| configurationFeature |
	self assert: m numberOfFeatures equals: 0.
	m importFeaturesAsCSV: self featureAnnotations.
	self assert: m numberOfFeatures equals: 63.
	
	configurationFeature := m featureNamed: 'Denomination'.
	self assert: configurationFeature featureName equals: 'Denomination'.
	
	self assert: configurationFeature numberOfAnnotations equals: 20.
	self assert: configurationFeature annotations size equals: 20.
	self assert: (configurationFeature annotations allSatisfy: [ :a | a feature == configurationFeature ])
]

{ #category : #'tests - features' }
SAJTest >> testFeatures02 [

	| annotations |
	annotations := 'fileName,lineRange,featureName,annotationGranualarity
Canvas.java,2-3,Feature1,FRAGMENT
Canvas.java,6-7,Feature2,FRAGMENT
Shape.java,6-7,Feature1,FRAGMENT
'.
	m importFeaturesAsCSV: annotations.
	self assert: m numberOfFeatures equals: 2.
	self assert: (m features flatCollect: #annotations) size equals: 3.

	self assert: (m unitNamed: 'Canvas') numberOfFeatures equals: 2.
	self assert: (m unitNamed: 'Canvas') features size equals: 2.
]

{ #category : #'tests - coree' }
SAJTest >> testInterfacesNamed [

	| cls |
	cls := m interfaceNamed: 'Shape'.
	self assert: cls notNil.
	self should: [ m interfaceNamed: 'NotExisting' ] raise: Error
]

{ #category : #'tests - packages' }
SAJTest >> testPackages [

	| packages firstClass secondClass |
	m := SAJModel new.

	m addSrcMLXML: self sourceCodeWithPackages.
	
	self assert: m numberOfUnits equals: 2.
	self assert: m units first isClass.
	
	firstClass := m units first.
	self assert: firstClass name equals: 'C'.
	self assert: firstClass packageName equals: 'p1'.
	self assert: firstClass package isNil.
	
	
	secondClass := m units second.
	self assert: secondClass name equals: 'D'.
	self assert: secondClass packageName equals: 'p2'.
	self assert: secondClass package isNil.
	
	m build.
	self assert: m numberOfPackages equals: 2.
	
	packages := m packages.
	self assert: (packages collect: #name) asArray equals: #('p1' 'p2').
	
	self assert: firstClass packageName equals: 'p1'.
	self assert: firstClass package name equals: 'p1'.
	self assert: firstClass package equals: packages first.
	
	self assert: secondClass packageName equals: 'p2'.
	self assert: secondClass package name equals: 'p2'.
	self assert: secondClass package equals: packages second.
	
	self assert: (packages first units includes: firstClass).
	self assert: (packages second units includes: secondClass).
	self deny: (packages first units includes: secondClass).
	self deny: (packages second units includes: firstClass).
]

{ #category : #'tests - coree' }
SAJTest >> testSuperclasses [

	| cls |
	cls := m classNamed: 'ColoredCircle'.
	self assert: cls superclassName equals: 'Circle'.
	self assert: cls superclass isNil.
	
	m build.
	
	self assert: cls superclass equals: (m classNamed: 'Circle').
	self assert: cls hasSuperclass.
	self assert: (m classNamed: 'Circle') superclass isNil.
	
	self assert: (m classNamed: 'Canvas') superclass isNil.
	self deny: (m classNamed: 'Canvas') hasSuperclass.
	
	
	self should: [ m classNamed: 'NotExisting' ] raise: Error
]

{ #category : #'tests - coree' }
SAJTest >> testUnitNamed [

	self assert: (m unitNamed: 'ColoredCircle') equals: (m classNamed: 'ColoredCircle').
	self assert: (m unitNamed: 'Shape') equals: (m interfaceNamed: 'Shape').
]
