/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SYSSystemID]
      ,[Mnemonic]
      ,[Active]
      ,[Name]
      ,[Generic]
      ,[Strength]
      ,[StrengthAmt1]
      ,[OrderUnit]
      ,[StrengthAmt2]
      ,[DispenseUnit]
      ,[AdminForm]
      ,[DispenseForm]
      ,[PrintNumber]
      ,[OrderSize]
      ,[DispenseSize]
      ,[NdcDinNumber]
      ,[BulkForm]
      ,[BulkSize]
      ,[UsageType]
      ,[CfsVersion]
      ,[LastUpdate]
      ,[SYSStartTime]
      ,[SYSEndTime]
  FROM [FHA_ANALYTICS].[FHA].[D_MeditechPHADrugMain]