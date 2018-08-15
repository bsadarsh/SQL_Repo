BEGIN TRANSACTION

BEGIN TRY

USE [eswPlatform]

DECLARE @ID AS INT = (SELECT MAX([BrandCountryServiceLevelId]) FROM [Parties].[BrandCountryServiceLevels])

INSERT [Parties].[BrandCountryServiceLevels] ([BrandCountryServiceLevelId], [BrandCountryActivationsId], [ServiceLevelId],  [DeclarationCurrencyId], [PackageIncoTermCodeId], [LastUpdateTime],[LastUpdateUser]) VALUES((@ID+1),(SELECT bca.BrandCountryActivationsId FROM Parties.BrandCountryActivations bca JOIN Parties.Brands b ON bca.BrandId = b.BrandId WHERE b.BrandName = 'Vinicio Boutique' AND CountryIso = 'CH'),(SELECT SERVICELEVELID FROM LOOKUPS.SERVICELEVELS WHERE Name = 'Express'),(SELECT CURRENCYID FROM LOOKUPS.CURRENCY WHERE CURRENCYISO = 'CHF'),(SELECT PackageIncoTermCodeId FROM [Lookups].[PackageIncoTermCodes] WHERE [Code] = 'DDP'),GETDATE(),'DavidM')

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE()
  ROLLBACK TRANSACTION
END CATCH