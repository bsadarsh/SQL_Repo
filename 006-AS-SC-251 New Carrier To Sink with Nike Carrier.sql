BEGIN TRANSACTION
DECLARE @carrierId int = 1010
DECLARE @lastUpdateTime Datetime = GETUTCDATE()
DECLARE @lastUpdateUser varchar(100) = 'SC-251 Singapore Post Quantum: AS'


BEGIN TRY

IF NOT EXISTS (SELECT * FROM Parties.Carriers WHERE CarrierId = @carrierId)
BEGIN
	
	SET IDENTITY_INSERT Parties.Carriers ON
	  INSERT INTO [Parties].[Carriers]([CarrierId], [CarrierName],[LastUpdateTime],[LastUpdateUser])
	  VALUES(@carrierId,N'Singapore Post Quantum',@lastUpdateTime,@lastUpdateUser)
	SET IDENTITY_INSERT Parties.Carriers OFF
END
ELSE
BEGIN
	print 'Carrier allready exist'
END


select * from Parties.Carriers

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH

