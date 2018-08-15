BEGIN TRANSACTION

BEGIN TRY

DECLARE @BrokerID AS INT = 9
INSERT [Parties].[Brokers] ([BrokerId], [BrokerName], [NameAddressId], [LastUpdateTime], [LastUpdateUser]) VALUES (@BrokerID, N'KWE', 0, GETUTCDATE(), N'System')

INSERT INTO [FileHandling].[FtpSites]([HostName],[UserName],[Password],[PendingDirectory],[ProcessedDirectory],[FileMask],[FileType],[StatusId],[Comment]
           ,[PollerInstanceId],[LastUpdateUser],[LocalProcessedFolder],[LocalErrorFolder],[LocalUploadFolder],[SetProcessedOnDownload],[FtpSSL],[BrokerId],[LastUpdateTime])
VALUES		('127.0.0.1',' ','','','','*.*','BrokerManifestOut',2,'Kwe CH Manifest Out Process Standard',1,'SC-59',
			'M:\DataFiles\KWE\Manifest\Outbound\Processed','M:\DataFiles\KWE\Manifest\Outbound\Error','M:\DataFiles\KWE\Manifest\Outbound\Pending',0,0,@BrokerID,GETUTCDATE())

INSERT INTO [Misc].[Sequences]([Name],[NextValue],[ResetAfter],[ResetValue],[ResetDate],[OnResetDaysToNextReset],[SequenceStartValue],[SequenceEndValue],[Active],[LastUpdateTime],[LastUpdateUser])
VALUES ('BrokerManifestOut-0009',1,NULL,NULL,NULL,NULL,NULL,NULL,1,GETUTCDATE(),'SC-59')

PRINT 'Committing....'

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH