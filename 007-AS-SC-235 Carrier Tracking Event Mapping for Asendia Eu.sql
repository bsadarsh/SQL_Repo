BEGIN TRANSACTION

DECLARE @CarrierId varchar(13) = 29
DECLARE @ExternalEventCode varchar(100) = 'ITM_IMP_220_20'
DECLARE @lastUpdateTime Datetime = GETUTCDATE()
DECLARE @ESW0000015ID int = (SELECT InternalEventCodeId FROM [Lookups].[TrackingInternalEventCodes] WHERE EventCode = 'ESW0000015')
DECLARE @lastUpdateUser varchar(100) = 'SC-135 Asendia EU Carrier ITM_IMP_220_20 Mapped to ESW0000015 : AS'
	
begin try

	IF NOT EXISTS (SELECT * FROM Lookups.TrackingExternalEventCodes WHERE CarrierId = @CarrierId and ExternalEventCode = @ExternalEventCode)
	BEGIN
		

		Print 'Insterting to Lookups.TrackingExternalEventCodes for Asendia EU'

		

			  INSERT INTO [Lookups].[TrackingExternalEventCodes] ([CarrierId], [ExternalEventCode], [ExternalEventDescription], [MilestoneId], [InternalEventCodesId], [LastUpdateTime], [LastUpdateUser]) VALUES (@CarrierId, @ExternalEventCode, N'Delivered', NULL, @ESW0000015ID, @Lastupdatetime,@LastupdateUser)

		
	END
	ELSE
		PRINT 'ExternalEventCode Allready Exists for Asendia EU'

	
   ---#######################################################################################################


	   --######################################################################################################

PRINT 'Committing....'


commit TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH




