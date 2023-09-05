SELECT TOP (1000)
      ,[SYSSystemID]
      ,[Number] as order_id
      ,[Patient] as patient_id
      ,RXIM.Med as main_med_id
      ,RXIM.Dose
      ,Drug5.DrugId
      ,[Sig]
      ,[OrderType]
      ,[Status]
      ,[Schedule]
      ,[Route]
      ,[EnterDate]
      ,[EnterTime]
      ,[DcDate]
      ,[DcTime]
      ,[StartDate]
      ,[StartTime]
      ,[StopDate]
      ,[StopTime]
      ,[Physician]
      ,[SoftStop]
      ,[TotalDoses]
      ,[StartDateSo]
      ,[StopDateSo]
      ,[StopDateOrig]
      ,[StartTimeSo]
      ,[StopTimeSo]
      ,[NewRx]
      FROM [FHA_ANALYTICS].[FHA].[F_MeditechPHARxMain]
  INNER JOIN [FHA_ANALYTICS].[FHA].[F_MeditechPHARxInpatientMedications].[Urn] = [Urn]
  INNER JOIN [FHA_ANALYTICS].[FHA].[D_MeditechPHADrugMain] as DRUG on DRUG.Mnemonic = RXIM.Med
  INNER JOIN [FHA_ANALYTICS].[FHA].[D_MeditechPHADrugMain5] as DRUG5 on DRUG5.Mnemonic = RXIM.Med