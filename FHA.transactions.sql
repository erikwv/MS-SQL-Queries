/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
  TOP (10000) FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.SYSSystemID,
  FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn,
  -- same as TxnRx (not Rx#)
  TxnDate,
  -- date YYYYMMDD
  TxnQ,
  -- sequential transaction number for the day
  FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Number,
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic,
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.NdcDinNumber,
  FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Dose,
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseUnit,
  FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Sig,
  -- dose frequency
  TxnDoses,
  -- num doses for txn
  TxnItems,
  -- num items for txn (4 500mg tabs to make up 2 doses of 2x500mg to equal a single order for 1000mg)
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseForm,
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseSize,
  TxnInventory,
  -- disp from loc ADC/PHARM
  TxnCost,
  -- cost per dose
  TxnChargeType,
  -- INP (inpatient) STKMED (stock med -no pt profile) STKIV (same as med but IV only)
  TxnDispForms,
  -- num units dispensed ?same as txn items
  TxnLocation,
  -- dispense location
  TxnEntered,
  -- datetime entered
  TxnComplete,
  -- datetime complete
  TxnOrderType,
  -- MED/MEDM/IVP etc.
  FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med AS main_med_id,
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId,
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugGenericName
FROM
  FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions
  INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn
  INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.TxnMed
  INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.TxnMed
  INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxMain ON FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn
WHERE
  FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.SYSSystemID = 'MC'
  AND TxnDate > 20210101