BEGIN TRANSACTION

BEGIN TRY

USE [eswPlatform]

DECLARE @BrandName AS VARCHAR(50), @FtpHostName AS NVARCHAR(100), @FtpUserName AS NVARCHAR(50), @FtpPassword AS NVARCHAR(50), @BrandCode AS NVARCHAR(10), @Folder AS NVARCHAR(50), @FileType AS NVARCHAR(50), @RootFolder AS NVARCHAR(50)
DECLARE @Pending AS NVARCHAR(50) = 'Pending'
DECLARE @Processed AS NVARCHAR(50) = 'Processed'
DECLARE @Error AS NVARCHAR(50) = 'Error'
DECLARE @BrandId AS VARCHAR(50)
DECLARE @LastUpdateUser AS VARCHAR(50) ='AS-PLAT-2927'

SET @BrandName = 'The Sting'
SET @FtpHostName = 'ftp.eshopworld.net'
SET @FtpUserName = 'TheStingFtp'
SET @FtpPassword = 'th3$t1nG'

SET @BrandCode = (SELECT BrandCode FROM Parties.Brands WHERE BrandName = @BrandName)
set @BrandId = (SELECT BrandId FROM Parties.Brands WHERE BrandName = @BrandName)
SET @RootFolder = 'M:\DataFiles\'
SET @Folder = 'Catalog'
SET @FileType = 'StandardCatalogFile'

DECLARE @Prefix AS VARCHAR(50) =
(
CASE
	WHEN @@SERVERNAME LIKE '%QA1%' THEN 'QA1'
	--WHEN @@SERVERNAME LIKE '%UAT2%' THEN 'UAT2'
	--WHEN @@SERVERNAME LIKE '%UAT75%' THEN 'UAT3'
	WHEN @@SERVERNAME LIKE '%UAT4%' THEN 'UAT4'
	--WHEN @@SERVERNAME LIKE '%UAT5%' THEN 'UAT5'
	--WHEN @@SERVERNAME LIKE '%UAT6%' THEN 'UAT6'
	--WHEN @@SERVERNAME LIKE '%-PROD-MSSQL%' THEN 'Production'
	ELSE 'UAT4'
END
)

IF(@Prefix IS NOT NULL)
BEGIN
	IF NOT EXISTS(SELECT * FROM [FileHandling].[FtpSites] WHERE [Comment] = @BrandName + ' ' + @Folder + ' File')
	BEGIN
		INSERT INTO [FileHandling].[FtpSites]([HostName],[UserName],[Password],[PendingDirectory],[ProcessedDirectory],[FileMask],[FileType],[LocalDownloadFolder],[StatusId]
		,[Comment],[PollerInstanceId],[LastUpdateTime],[LastUpdateUser],[ErrorDirectory],[LocalProcessedFolder],[LocalErrorFolder],[OtherValues],[LocalUploadFolder]
		,[SetProcessedOnDownload],[FtpSSL],[CompanyId],[BrandId],[BrokerId],[CarrierId],[UnprocessedExpiryHours],[DependencyFileType],[LinkedFtpSiteId])
		VALUES
		(
		@FtpHostName,@FtpUserName,@FtpPassword,
		'/' + @BrandCode + '/' + @Prefix + '/' + @Folder + '/' + @Pending,
		'/' + @BrandCode + '/' + @Prefix + '/' + @Folder + '/' + @Processed,
		'*.*',@FileType,
		@RootFolder + @BrandCode + '\' + @Folder + '\' + @Pending,
		'1',
		@BrandName + ' ' + @Folder + ' File',
		'1',GETDATE(),@LastUpdateUser,
		'/' + @BrandCode + '/' + @Prefix + '/' + @Folder + '/' + @Error,
		@RootFolder + @BrandCode + '\' + @Folder + '\' + @Processed,
		@RootFolder + @BrandCode + '\' + @Folder + '\' + @Error,
		'',	'',	0,0,NULL,@BrandId,NULL,NULL,NULL,NULL,NULL)
	END
END

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH