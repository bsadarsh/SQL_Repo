
BEGIN TRANSACTION

BEGIN TRY


update parties.BrandDeclarationRegionCountries 
set RegionId = 18
where countryIso = 'CN'
and BrandId not in (1,12)


update parties.BrandDeclarationRegionCountries 
set RegionId = 18
where countryIso IN ('MX','BH','KW','QA')
and BrandId not in (1,8,12)

update parties.BrandDeclarationRegionCountries 
set RegionId = 18
where countryIso IN ('NO','CH','HK')
and BrandId in (8)

IF NOT EXISTS (select * from Lookups.CatalogDefaults where BrandId = 8 and LandingCountryIso ='AU')
BEGIN
    insert into Lookups.CatalogDefaults values (8,12,'AU',NULL,0.3,0.05,2)
END

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH
