BEGIN TRANSACTION
DECLARE @carrierId int = 1010
DECLARE @lastUpdateTime Datetime = GETUTCDATE()
DECLARE @lastUpdateUser varchar(100) = 'SC-250 Singapore Post Quantium Update Carrier Name: AS'


BEGIN TRY

IF EXISTS (SELECT * FROM Parties.Carriers WHERE CarrierId = @carrierId)
BEGIN
	
	update Parties.Carriers 
	set CarrierName ='Singapore Post-Quantium',LastUpdateTime=@lastUpdateTime,LastUpdateUser=@lastUpdateUser
	where CarrierId =@carrierId

END
ELSE
BEGIN
	print 'Carrier not  exist'
END




COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH

