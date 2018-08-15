BEGIN TRANSACTION

BEGIN TRY

Declare @LastUpdateTime Datetime = GETUTCDATE()
Declare @LastUpdateUser varchar(100) = 'SC-228 Update DefaultPackageScanStatusCode'
Declare @BrandId INT

Select @BrandId = BrandId from Parties.Brands where BrandCode='VBQ'

UPDATE Parties.BrandCountryActivations 
SET
DefaultPackageScanStatusCodeId =null,LastUpdateTime = @LastUpdateTime,LastUpdateUser = @LastUpdateUser
WHERE BrandId = @BrandId 
and 
DefaultPackageScanStatusCodeId =1


COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH

