SELECT
  TOP (1000) FHA_ANALYTICS.FHA.F_MeditechPHARxMain.SYSSystemID,
  --systemid assoc w/pt record from RXM = F_MeditechPHARxMain (e.g. 'RX Main')
  Number AS order_id,
  --renames the Number column to order_id
  Patient AS patient_id,
  --renames the Patient column to patient_id
  FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med AS main_med_id,
  --renames F_MeditechPHARxInpatientMedications.Med to main_med_id
  FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Dose,
  --selects the F_MeditechPHARxInpatientMedications.Dose column
  FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId,
  --selects Drug.Id column from 'Drug5' = (D_MeditechPHADrugMain5.DrugId)
  Sig,
  OrderType,
  STATUS,
  Schedule,
  Route,
  EnterDate,
  EnterTime,
  DcDate,
  DcTime,
  StartDate,
  StartTime,
  StopDate,
  StopTime,
  Physician,
  SoftStop,
  TotalDoses,
  StartDateSo,
  StopDateSo,
  StopDateOrig,
  StartTimeSo,
  StopTimeSo,
  NewRx
FROM
  FHA_ANALYTICS.FHA.F_MeditechPHARxMain
  INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Urn -- JOINS RXM with RXIM on Urn
  INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med -- JOINS DRUG with RXIM on D_MeditechPHADrugMain.Mnemonic = RXIM.Med (e.g. both drug mnemonics)
  INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med -- Note: DRUG5 contains the generic name info
WHERE
  EnterDate > 20200101
  AND FHA_ANALYTICS.FHA.F_MeditechPHARxMain.SYSSystemID = 'MC' --'MC' is the mnemonic for Meditech CS and EX is for expanse and DRUG.Mnemonic = 'PANTO40T'