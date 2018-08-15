
BEGIN TRANSACTION

BEGIN TRY

	DECLARE @LastupdateTime Datetime = getUTCDate()
	DECLARE @LastUpdateUser nvarchar(30) = 'SC-236 Milan-Moscow:AS'
	
	--####### Operation.Airport code###########################################


	--00. Add Airports MXP/IT and SVO/RU to Operations.Airportss

	IF NOT EXISTS (SELECT * FROM Operations.Airports  WHERE AirportCode='MXP' AND CountryIso='IT' )
	BEGIN
		INSERT Operations.Airports ([AirportCode],[CountryIso], [LastUpdateTime], [LastUpdateUser]) 
		VALUES (N'MXP', N'IT', @LastupdateTime, @LastUpdateUser)
	END
	ELSE
		PRINT 'Airport MXP  already exists skipping insert'

	IF NOT EXISTS (SELECT * FROM Operations.Airports  WHERE AirportCode='SVO' AND CountryIso='RU')
	BEGIN
		INSERT Operations.Airports ([AirportCode],[CountryIso], [LastUpdateTime], [LastUpdateUser]) 
		VALUES (N'SVO', N'RU', @LastupdateTime, @LastUpdateUser)
	END
	
	ELSE
		PRINT 'Airport SVO already exists skipping insert'
   ---#######################################################################################################

	--1. Add carriers AIRBRIDGE /RU/580 to Operations.AirlineCarriers
	IF NOT EXISTS (SELECT * FROM [Operations].[AirlineCarriers]  WHERE CarrierCode = 'RU')
	BEGIN
		INSERT [Operations].[AirlineCarriers] ([CarrierCode], [CarrierName], [Prefix], [LastUpdateTime], [LastUpdateUser]) 
		VALUES (N'RU', N'AIRBRIDGE', N'580', @LastupdateTime, @LastUpdateUser)
	END
	ELSE
		PRINT 'Carrier RU already exists skipping insert'
		
			
	--##############################################################################################################
		
	--###################################################################################################################
	
	--a) Add 'MXP ' to 'SVO'  for carrier 'RU' 
		IF NOT EXISTS (SELECT * FROM [Operations].[AirLegCarriers]  WHERE [OriginAirportCode] = 'MXP' AND [DestinationAirportCode] = 'SVO' AND CarrierCode = 'RU')
	BEGIN
			INSERT [Operations].[AirLegCarriers] ([OriginAirportCode], [DestinationAirportCode], [CarrierCode], [LastUpdateTime], [LastUpdateUser]) 
			VALUES (N'MXP', N'SVO', N'RU', @LastupdateTime, @LastUpdateUser)
	END
	ELSE
		PRINT '[AirLegCarriers] MXP -> SVO for RU already exists skipping insert'

	
	--######################################################################################################
	
	-- 3. Add AirRoutes
	
	--a) MXP -> SVO
	IF NOT EXISTS (SELECT * FROM [Operations].[AirRoutes]  WHERE [OriginAirportCode] = 'MXP' AND [DestinationAirportCode] = 'SVO')
	BEGIN
		INSERT [Operations].[AirRoutes] ([OriginAirportCode], [Via1AirportCode], [Via2AirportCode], [DestinationAirportCode], [LastUpdateTime], [LastUpdateUser]) 
		VALUES (N'MXP', NULL, NULL, N'SVO', @LastupdateTime, @LastUpdateUser)
	END
	ELSE
		PRINT '[AirRoutes] MXP -> SVO already exists skipping insert'
	--######################################################################################################
					 
	   --4 Configure Origin and Dest agents for MXP -> SVO
	  
	   DECLARE @AirportAgentId INT = (SELECT (MAX(AirportAgentId)) FROM Operations.AirportAgents)  
	   PRINT '1'
	   IF NOT EXISTS (SELECT * FROM [Operations].[AirportAgents]  WHERE [OriginAirportCode] = 'MXP' AND [DestinationAirportCode] = 'SVO')
	   BEGIN
			 
			
			  --a) Configure Origin agent for SIN -> TPE  Add Address for EVA Air
				INSERT INTO [Parties].[NameAddresses]
				([NameAddressTypeId],[FirstName],[LastName],[Unit],[POBox],[Address1],[Address2],[Address3],[City],[PostalCode],[CountryIso],[Telephone],[Email],[Region],[LastUpdateTime],[LastUpdateUser])
				VALUES(7, ' US Direct E-Commerce Ltd C/O Asendia Italy S.p.a. ', '', null, null,'Via Cassino d’Alberi , 21,20067 Tribiano', '','', '', '20067 Tribiano', 'IT','','','', @Lastupdatetime, @LastUpdateUser)
				
				DECLARE @NameAddressId bigint = (SELECT @@IDENTITY)
				DECLARE @MaxPortAgentId bigint = (SELECT (MAX(PortAgentId +1)) FROM Parties.PortAgents)

				INSERT INTO [Parties].[PortAgents]([PortAgentId],[PortAgentName],[NameAddressId],[LastUpdateTime],[LastUpdateUser])
				VALUES(@MaxPortAgentId, 'US Direct E-Commerce Ltd C/O Asendia Italy S.p.a. ', @NameAddressId, @Lastupdatetime, @LastUpdateUser)

				INSERT INTO [Operations].[AirportAgents]([AirportAgentId],[OriginAirportCode],[DestinationAirportCode],[PortAgentId],[OriginAgent],[DestinationAgent],[IsActive],[LastUpdateTime],[LastUpdateUser])
				VALUES((@AirportAgentId+1) , 'MXP' , 'SVO', @MaxPortAgentId , 1 , 0, 1, @Lastupdatetime, @LastUpdateUser)
				
				
	  
	  PRINT '2'
			  --aa) Add Destination PortAgent NameAddress for EVA Air
				INSERT INTO [Parties].[NameAddresses]
				([NameAddressTypeId],[FirstName],[LastName],[Unit],[POBox],[Address1],[Address2],[Address3],[City],[PostalCode],[CountryIso],[Telephone],[Email],[Region],[LastUpdateTime],[LastUpdateUser])
				VALUES(7, 'AO ARMADILLO BUSINESS PARCEL ', '', null, null,'129226 MOSCOW ', 'DOKUKINA STR 16 BLDG 1, +7 495 775 42 75 ','', '', '', 'RU', '+7 495 775 42 75 ','','', @Lastupdatetime, @LastUpdateUser)
				
				DECLARE @NameAddressId2 bigint = (SELECT @@IDENTITY)
				DECLARE @MaxPortAgentId2 bigint = (SELECT (MAX(PortAgentId +1)) FROM Parties.PortAgents)
				
				INSERT INTO [Parties].[PortAgents]([PortAgentId],[PortAgentName],[NameAddressId],[LastUpdateTime],[LastUpdateUser])
				VALUES(@MaxPortAgentId2, 'AO ARMADILLO BUSINESS PARCEL', @NameAddressId2, @Lastupdatetime, @LastUpdateUser)

			  INSERT INTO [Operations].[AirportAgents]([AirportAgentId],[OriginAirportCode],[DestinationAirportCode],[PortAgentId],[OriginAgent],[DestinationAgent],[IsActive],[LastUpdateTime],[LastUpdateUser])
			  VALUES((@AirportAgentId+2) , 'MXP' , 'SVO', @MaxPortAgentId2, 0, 1, 1, @Lastupdatetime, @LastUpdateUser)

	   END
	   ELSE
			  PRINT '[Operations].[AirportAgents] MXP -> SVO already exists skipping insert'

	   --######################################################################################################


PRINT 'Committing....'

COMMIT TRANSACTION

END TRY

BEGIN CATCH
  PRINT 'An error occurred: ' +  ERROR_MESSAGE() 
  ROLLBACK TRANSACTION
END CATCH





